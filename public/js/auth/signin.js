"use strict";

// Class definition
var KTSigninGeneral = (function () {
  // Elements
  var form;
  var submitButton;
  var validator;

  // Handle form
  var handleValidation = function (e) {
    // Init form validation rules. For more info check the FormValidation plugin's official documentation:https://formvalidation.io/
    validator = FormValidation.formValidation(form, {
      fields: {
        email: {
          validators: {
            regexp: {
              regexp: /^[^\s@]+@[^\s@]+\.[^\s@]+$/,
              message: i18next.t("the value is not a valid email address"),
            },
            notEmpty: {
              message: i18next.t("email address is required"),
            },
          },
        },
        password: {
          validators: {
            notEmpty: {
              message: i18next.t("password is required"),
            },
          },
        },
      },
      plugins: {
        trigger: new FormValidation.plugins.Trigger(),
        bootstrap: new FormValidation.plugins.Bootstrap5({
          rowSelector: ".fv-row",
          eleInvalidClass: "", // comment to enable invalid state icons
          eleValidClass: "", // comment to enable valid state icons
        }),
      },
    });
  };

  var handleSubmitSignin = function (e) {
    // Handle form submit
    submitButton.addEventListener("click", function (e) {
      // Prevent button default action
      e.preventDefault();

      if ($("div").is(".cf-turnstile") == true) {
        var datas = {
          email: $("#signin-email").val(),
          passwd: $("#signin-passwd").val(),
          turnstile: turnstile.getResponse(),
        };
      } else {
        datas = {
          email: $("#signin-email").val(),
          passwd: $("#signin-passwd").val(),
        };
      }
      // Validate form
      validator.validate().then(function (status) {
        if (status == "Valid") {
          // Show loading indication
          submitButton.setAttribute("data-kt-indicator", "on");

          // Disable button to avoid multiple click
          submitButton.disabled = true;

          // Simulate ajax request
          setTimeout(function () {
            // Show message popup. For more info check the plugin's official documentation: https://sweetalert2.github.io/
            $.ajax({
              type: "POST",
              url: "/auth/signin",
              dataType: "json",
              data: datas,
              success: function (data) {
                if (data.ret == 1) {
                  form.querySelector('[name="email"]').value = "";
                  form.querySelector('[name="password"]').value = "";
                  var redirectUrl = form.getAttribute("data-kt-redirect-url");
                  if (redirectUrl) {
                    location.href = redirectUrl;
                  }
                } else {
                  Swal.fire({
                    text: data.msg,
                    icon: "error",
                    buttonsStyling: !1,
                    confirmButtonText: "OK, got it!",
                    customClass: {
                      confirmButton: "btn btn-primary",
                    },
                  });
                  // Hide loading indication
                  submitButton.removeAttribute("data-kt-indicator");

                  // Enable button
                  submitButton.disabled = false;
                }
              },
            });
          }, 2000);
        } else {
          // Show error popup. For more info check the plugin's official documentation: https://sweetalert2.github.io/
          Swal.fire({
            text: i18next.t(
              "Đã phát hiện một số lỗi, vui lòng thử lại"
            ),
            icon: "error",
            buttonsStyling: false,
            confirmButtonText: "OK, got it!",
            customClass: {
              confirmButton: "btn btn-primary",
            },
          });
        }
      });
    });
  };

  // Public functions
  return {
    // Initialization
    init: function () {
      form = document.querySelector("#kt_sign_in_form");
      submitButton = document.querySelector("#kt_sign_in_submit");

      handleValidation();
      handleSubmitSignin(); // used for demo purposes only, if you use the below ajax version you can uncomment this one
      //handleSubmitAjax(); // use for ajax submit
    },
  };
})();

// On document ready
KTUtil.onDOMContentLoaded(function () {
  KTSigninGeneral.init();
});
