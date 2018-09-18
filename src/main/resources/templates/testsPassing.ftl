<#import "parts/common.ftl" as c>
<#include "parts/security.ftl">

<@c.page>

    <#include "parts/testPass.ftl" />

</@c.page>

<script>
    $(document).ready(function () {
    var offset = $('#fixed').offset();
    var topPadding = 0;
    $(window).scroll(function() {
        if ($(window).scrollTop() > offset.top) {
            $('#fixed').animate({marginTop: $(window).scrollTop() - offset.top + topPadding});
            $('#fixed').stop(true, true);
        }
        else {
            $('#fixed').animate({marginTop: 0});
            $('#fixed').stop(true, true);
        }
    });
});
</script>
