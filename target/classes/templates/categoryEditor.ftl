<#include "parts/security.ftl">
<#import "parts/common.ftl" as c>


<@c.page>
<#--<h3>${userChannel.username}</h3>-->
    <#--<#if !isCurrentUser>-->
        <#--<#if isSubscriber>-->
<#--<a class="btn btn-info" href="/user/unsubscribe/${userChannel.userId}">Unsubscribe</a>-->
        <#--<#else>-->
<#--<a class="btn btn-info" href="/user/subscribe/${userChannel.userId}">Subscribe</a>-->
        <#--</#if>-->
    <#--</#if>-->
<#--<div class="container my-3">-->
    <#--<div class="row">-->
        <#--<div class="col">-->
            <#--<div class="card">-->
                <#--<div class="card-body">-->
                    <#--<div class="card-title">Subscriptions</div>-->
                    <#--<h3 class="card-text">-->
                        <#--<a href="/user/subscriptions/${userChannel.userId}/list">${subscriptionsCount}</a>-->
                    <#--</h3>-->
                <#--</div>-->
            <#--</div>-->
        <#--</div>-->
        <#--<div class="col">-->
            <#--<div class="card">-->
                <#--<div class="card-body">-->
                    <#--<div class="card-title">Subscribers</div>-->
                    <#--<h3 class="card-text">-->
                        <#--<a href="/user/subscribers/${userChannel.userId}/list">${subscribersCount}</a>-->
                    <#--</h3>-->
                <#--</div>-->
            <#--</div>-->
        <#--</div>-->
    <#--</div>-->
<#--</div>-->

    <#include "parts/categoryEdit.ftl" />

    <#include "parts/categoryList.ftl" />
</@c.page>

<script>
    $(document).on('change', '.fileUpload', function (event) {
        var filename = $(this).closest('.fileUpload').find('#uploadBtn').val().replace(/.*\\/, "");
        $(this).closest('.inputBtnSection').find("#uploadFile").val(filename);
    });
</script>