
class Account


  constructor: -> @accountPage()


  accountPage: =>
    if $(".auto-submit").exists() then $(".auto-submit").submit()
    if $(".form-date-fields").exists()
      $(".form-date-select").on "change focus", => @updateFormDate()
    $(".form-members-create-submit").on "click", (event) ->
      event.preventDefault()
      if $(".birthday-date-year").val() isnt "-1" and $(".birthday-date-month").val() isnt "-1" and $(".birthday-date-day").val() isnt "-1"
        $(".form-members-create").submit()
      else
        alert "Please fill out the day, month, and year of your birthday."


  updateFormDate: =>
    $(".form-birthday").val("#{$(".birthday-date-year").val()}-#{$(".birthday-date-month").val()}-#{$(".birthday-date-day").val()}")


if $(".layout-account").exists() then new Account()
