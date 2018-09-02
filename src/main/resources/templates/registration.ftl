<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>

<@c.page>
<div class="my-3"><h5>Добавление нового пользователя</h5></div>
<#--${message?ifExists}-->
    <@l.login "/registration" true/>

</@c.page>

<!--Ajax -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
  <script type="text/javascript">
      function doAjax() {
          $.ajax({
              url: 'registration',
              data: ({password: $('#password').val()}),
              success: function (data) {
                  var power = $(data).find('#strengthValue1').val();
                  var color = $(data).find('#color').val();
                  
                  $('#strengthValue').replaceWith('<input type="text" style="float: right; color:' + color
                          + ';" readonly class="form-control-plaintext" id="strengthValue"'
                          +  'name="num_of_questions" value="' + power + '">');
                  // $('#strengthValue').val($(data).find('#strengthValue1').val());
              }
          })
      }
  </script>