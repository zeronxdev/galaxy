<?php

namespace App\Command;

use App\Models\User as ModelsUser;
use App\Models\Setting;
use App\Utils\Hash;
use App\Utils\Tools;
use Exception;
use Ramsey\Uuid\Uuid;

class User extends Command
{
    public $description = ''
        . '├─=: php xcat User [câu lệnh]' . PHP_EOL
        . '│ ├─ getCookie               - 获取指定用户的 Cookie' . PHP_EOL
        . '│ ├─ createAdmin             - 创建管理员帐号' . PHP_EOL
        . '│ ├─ resetTraffic            - 重置所有用户流量' . PHP_EOL
        . '│ ├─ createUUID              - 为所有用户生成新的 UUID' . PHP_EOL
        . '│ ├─ createSubToken          - 为所有用户生成新的 Sub token' . PHP_EOL
        . '│ ├─ createShadowsocksPasswd          - 为所有用户生成新的 createShadowsocksPasswd' . PHP_EOL;

    public function boot()
    {
        if (count($this->argv) === 2) {
            echo $this->description;
        } else {
            $methodName = $this->argv[2];
            if (method_exists($this, $methodName)) {
                $this->$methodName();
            } else {
                echo 'Câu lệnh không tồn tại' . PHP_EOL;
            }
        }
    }


    /**
     * 重置所有用户流量
     *
     * @return void
     */
    public function resetTraffic()
    {
        try {
            ModelsUser::where('enable', 1)->update([
                'd'          => 0,
                'u'          => 0,
                'last_day_t' => 0,
            ]);
        } catch (Exception $e) {
            echo $e->getMessage();
            return;
        }
        echo 'reset traffic successful' . PHP_EOL;
    }

    /**
     * 为所有用户生成新的UUID
     *
     * @return void
     */
    public function createUUID()
    {
        $users = ModelsUser::all();
        $current_timestamp = time();
        foreach ($users as $user) {
            /** @var ModelsUser $user */
            $user->uuid = $user->createUUID($current_timestamp);
            $user->save();
        }
        echo 'generate UUID successful' . PHP_EOL;
    }

    public function createSubToken()
    {
        $users = ModelsUser::all();
        foreach ($users as $user) {
            $user->subscription_token = $user->createSubToken();
            $user->save();
        }
        echo 'create subscription token successful' . PHP_EOL;
    }

    public function createShadowsocksPasswd()
    {
        $users = ModelsUser::all();
        foreach ($users as $user) {
            $user->passwd = $user->createShadowsocksPasswd();
            $user->save();
        }
        echo 'create shadowsocks passwd successful' . PHP_EOL;
    }

    /**
     * 创建 Admin 账户
     *
     * @return void
     */
    public function createAdmin()
    {
        if (count($this->argv) === 3) {
            echo "Tiến thành tạo tài khoản Admin \n";
              // ask for input
            fwrite(STDOUT, '(1/3) Nhập Email Admin: ') . PHP_EOL;
              // get input
            $email = strtolower(trim(fgets(STDIN)));
            $email ?? die("Hãy nhập Email Admin\r\n");
            
              // write input back
            fwrite(STDOUT, "(2/3) Đặt mật khẩu cho Email Admin：") . PHP_EOL;
            $passwd = trim(fgets(STDIN));
            $passwd ?? die("Hãy nhập mật khẩu Email Admin\r\n");
            
            fwrite(STDOUT, "(3/3) Nhập Y để hoàn tất thiết lập：");
            $y = trim(fgets(STDIN));
        } elseif (count($this->argv) === 5) {
            [,,, $email, $passwd] = $this->argv;
            $y                    = 'y';
        }

        if (strtolower($y) == 'y') {
            echo "Đang tạo tài khoản Admin \n";
            $current_timestamp = time();
              // create admin user
            $user                     = new ModelsUser();
            $user->email              = $email;
            $user->password           = Hash::passwordHash($passwd);
            $user->passwd             = $user->createShadowsocksPasswd();
            $user->uuid               = Uuid::uuid5(Uuid::NAMESPACE_DNS, $email . '|' . $current_timestamp);
            $user->t                  = 0;
            $user->u                  = 0;
            $user->d                  = 0;
            $user->transfer_enable    = 0;
            $user->ref_by             = 0;
            $user->is_admin           = 1;
            $user->signup_date        = date('Y-m-d H:i:s');
            $user->money              = 0;
            $user->class              = 0;
            $user->node_speedlimit    = 0;
            $user->theme              = $_ENV['theme'];
            $user->subscription_token = $user->createSubToken();

            if ($user->save()) {
                echo "Tạo tài khoản Admin thành công \n" . PHP_EOL;
            } else {
                echo "Tạo không thành công, hãy kiểm tra lại database \n" . PHP_EOL;
            }
        } else {
            echo "Đã hủy quá trình tạo tài khoản Admin \n" . PHP_EOL;
        }
    }

    /**
     * 获取 USERID 的 Cookie
     *
     * @return void
     */
    public function getCookie()
    {
        if (count($this->argv) === 4) {
            $user = ModelsUser::find($this->argv[3]);
            $expire_in = 86400 + time();
            echo Hash::cookieHash($user->password, $expire_in) . ' ' . $expire_in;
        }
    }
}
