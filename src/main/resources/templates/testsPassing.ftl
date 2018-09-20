<#import "parts/common.ftl" as c>
<#include "parts/security.ftl">

<@c.page>

    <#include "parts/testPass.ftl" />

</@c.page>

<script>
    $(document).ready(function () {
    var offset = $('#fixed').offset();
    var topPadding = 0;
    var heightNav =  $('#bar').height() + 16;
    $(window).scroll(function() {
        if ($(window).scrollTop() >= 0) {
            $('#fixed').animate({marginTop: $(window).scrollTop() - offset.top + topPadding + heightNav  });
            $('#fixed').stop(true, true);
        }
        // else {
        //     $('#fixed').animate({marginTop: 0});
        //     $('#fixed').stop(true, true);
        // }
    });
});
</script>
