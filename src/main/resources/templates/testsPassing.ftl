<#import "parts/common.ftl" as c>

<@c.page>
<div class="row">
    <div class="col">

        <#if test.image_path_end??>
            <img src="/img/${test.image_path_start}" class="card-img-top">
        </#if>

        <label>${test.testname} </label>
                <#list questions as que>
                    <div> ${que.question}
                    </div>
                <#else>
                    No questions
                </#list>

        <#--<#list answers as ans>-->
                    <#--<div> ${ans.answer}-->
                    <#--</div>-->
        <#--<#else>-->
                    <#--No questions-->
        <#--</#list>-->
    </div>
</div>

</@c.page>