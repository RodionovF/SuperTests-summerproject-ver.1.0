<#import "parts/common.ftl" as c>

<@c.page>
<div class="row">
    <div class="col-8">



        <div class="card my-3">
            <div class="card-header">
                <#if test.image_path_end??>
                    <img src="/img/${test.image_path_start}" class="img-thumbnail my-3">
                </#if>

                <h3>${test.testname} </h3>
            </div>

            <div class="card-body">
                <p class="card-text">
                    <ol>
                        <#list questions as que>
                            <h4><li class="card-title mt-5">${que.question}</li></h4>
                            <img src="/img/${que.image_path}" class="card-img-top rounded mb-3">
                                <#list answers as ans>
                                    <#if ans.questionId.question_id == que.question_id>
                                        <ul class="list-group checked-list-group">
                                         <div class="form-group input-group">
                                             <div class="input-group-prepend">
                                                 <div class="input-group-text mb-1">


                                                    <#list buttonTypes as butType>

                                                        <#if butType.numberQuestion == que.question_id>
                                                            <#if butType.type == true>
                                                            <input type="radio" name="radio"aria-label="Radio button for following text input">
                                                            <#else>
                                                                <input type="checkbox" name="active" id="output1" value="1"/>
                                                                <input type="hidden" value="0" name="active"/>
                                                            </#if>
                                                        </#if>
                                                    </#list>


                                                 </div>
                                             </div>
                                             <input type="text" name="answer" id="output2" class="form-control mb-1"
                                                   value="${ans.answer}" disabled>
                                         </div>
                                        </ul>
                                    </#if>
                                <#else>
                                    No answers
                                </#list>

                            <a href="#" class="btn btn-primary">Ответить</a>
                        <#else>
                            No questions
                        </#list>
                    </ol>
                </p>
            </div>
        </div>




<#--<div>-->
<#--${que.question}-->
<#--</div>-->
<#--<#list answers as ans>-->
<#--<#if ans.questionId.question_id == que.question_id>-->
<#--<div>-->
<#--${ans.answer}-->
<#--</div>-->
<#--</#if>-->
<#--<#else>-->
<#--No answers-->
<#--</#list>-->




    </div>
</div>




</@c.page>