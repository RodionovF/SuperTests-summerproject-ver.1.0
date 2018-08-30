<#import "parts/common.ftl" as c>

<@c.page>
<div class="row">

    <div class="col-8">
        <div class="card my-3">
            <div class="card-header">
                <#if test.image_path_start??>
                    <img src="/img/${test.image_path_start}" class="img-thumbnail my-3">
                <#else>
                </#if>

                <h3>${test.testname} </h3>
            </div>

            <div class="card-body">
                <p class="card-text">
                    <ol>
                        <#list questions as que>
                            <h4><li class="card-title mt-5">${que.question}</li></h4>

                            <#if que.image_path??>
                                <img src="/img/${que.image_path}" class="card-img-top rounded mb-3">
                            </#if>
                                <#list answers as ans>
                                    <#if ans.questionId.question_id == que.question_id>
                                        <ul class="list-group checked-list-group">
                                         <div class="form-group input-group">
                                             <div class="input-group-prepend">
                                                 <div class="input-group-text mb-1">


                                                    <#list buttonTypes as butType>

                                                        <#if butType.numberQuestion == que.question_id>
                                                            <#if butType.type == true>
                                                            <input type="radio" name="${que.question}" aria-label="Radio button for following text input">
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
                            <button type="button" class="btn btn-primary">Ответить</button>
                        <#else>
                            No questions
                        </#list>
                    </ol>
                </p>
            </div>
        </div>
    </div>
    <div class="col-3 my-3">
        Время прохождения теста:
        <span id='timer-counter' style='color:blue;font-size:150%;font-weight:bold;'></span>
        <script>
            startdate = new Date();
            clockStart = startdate.getTime();
            function initStopwatch() {
                var thisTime = new Date();
                return (thisTime.getTime() - clockStart)/1000;
            }

            var interval = setInterval(function() {
                var tSecs = Math.round(initStopwatch());
                var iSecs = tSecs % 60;
                var iMins = Math.round((tSecs-30)/60);
                var sSecs ="" + ((iSecs > 9) ? iSecs : "0" + iSecs);
                var sMins ="" + ((iMins > 9) ? iMins : "0" + iMins);
                document.getElementById("timer-counter").innerHTML = sMins+":"+sSecs;
            }, 1000);
        </script>
    </div>

    <div class="col-1">
        <a class="btn btn-dark my-3" href="/categories/${category.categoryId}">Назад</a>
    </div>

</div>



</@c.page>

