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
                <h3>${test.testname}</h3>
            </div>
            <div class="card-body">
                <p class="card-text">
                <ol>
                        <#list questions as que>
                            <h4>
                                <li class="card-title mt-5">${que.question}</li>
                            </h4>
                            <#if que.image_path??>
                                <img src="/img/${que.image_path}" class="card-img-top rounded mb-3">
                            </#if>
                                <#list answers as ans>
                                    <#if ans.questionId.question_id == que.question_id>
                                        <ul class="list-group checked-list-group">
                                            <div class="form-group input-group">
                                                <div class="input-group-prepend">
                                                    <div class="input-group-text mb-1" id="load">
                                                    <#list buttonTypes as buttonType>
                                                        <#if buttonType.question_id == que.question_id>
                                                            <#if buttonType.type == true>
                                                            <input type="radio" name="${que.question}" id="${ans.answer_id}"
                                                                   aria-label="Radio button for following text input"/>
                                                            <#else>
                                                                <input type="checkbox" class="check"  name="check${que.question_id}[]" id="${ans.answer_id}"/>
                                                            </#if>
                                                        </#if>
                                                    </#list>
                                                    </div>
                                                </div>
                                                <input type="text" class="form-control mb-1" value="${ans.answer}" disabled/>
                                            </div>                                        </ul>
                                    </#if>
                                <#else>
                                    No answers
                                </#list>
                            <button type="button" class="btn btn-primary" id="${que.question_id}" OnClick="getAnswers${que.question_id}();">
                                Ответить
                            </button>

                            <script type="text/javascript">
                                function getAnswers${que.question_id}() {

                                    var checkboxes = [];

                                    $("input[name='check${que.question_id}[]']:checked").each(function () {
                                        checkboxes.push($(this).attr('id'));
                                        // checkboxes.push($(this).val());
                                    });

                                    $('#numAnswers').val(function (i, val) {
                                        $.ajax({
                                            url: '/categories/${category.categoryId}/${test.test_id}',
                                            type: 'GET',
                                            data: {
                                                checkboxes: checkboxes,
                                                currentQuestion: ${que.question}
                                            },
                                            success: function () {
                                                alert('Request has returned');
                                                $('#${que.question_id}').replaceWith('<button type="button" class="btn btn-secondary" OnClick="Answers();" disabled>Ответить</button>');
                                                $("input[name='check${que.question_id}[]']").prop('checked', false);
                                            }
                                        });
                                        return val * 1 + 1
                                    });
                                };
                            </script>

                        <#else>
                            No questions
                        </#list>
                </ol>
                </p>
            </div>
        </div>
    </div>

    <div class="col-3 my-3">
        <label>Время прохождения теста:</label>
        <span id="timer-counter" style="color:blue;font-size:150%;font-weight:bold;"></span>

        <script>
            startdate = new Date();
            clockStart = startdate.getTime();

            function initStopwatch() {
                var thisTime = new Date();
                return (thisTime.getTime() - clockStart) / 1000;
            }

            var interval = setInterval(function () {
                var tSecs = Math.round(initStopwatch());
                var iSecs = tSecs % 60;
                var iMins = Math.round((tSecs - 30) / 60);
                var sSecs = "" + ((iSecs > 9) ? iSecs : "0" + iSecs);
                var sMins = "" + ((iMins > 9) ? iMins : "0" + iMins);
                document.getElementById("timer-counter").innerHTML = sMins + ":" + sSecs;
            }, 1000);
        </script>

        <div class="form-group row">
            <label class="col-sm-7 col-form-label ">Вы ответили на</label>
            <input type="text" readonly class="form-control-plaintext col-sm-2" id="numAnswers" value="0"
                   name="numAnswers"/>
            <label class="col-sm-7 col-form-label ">из ${test.num_of_questions} вопросов.</label>
        </div>
    </div>

    <div class="col-1">
        <a class="btn btn-dark my-3 ml-3" href="/categories/${category.categoryId}">Назад</a>
    </div>
</div>

</@c.page>

