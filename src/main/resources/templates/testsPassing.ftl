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
                 <#if statOfTest??>
                        <input type="hidden" id="statOfTest" value="${statOfTest}"/>
                 </#if>
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
                                                                <input type="radio" class="radio"
                                                                       name="radio${que.question_id}[]"
                                                                       id="${ans.answer_id}"/>
                                                            <#else>
                                                                <input type="checkbox" class="check"
                                                                       name="check${que.question_id}[]"
                                                                       id="${ans.answer_id}"/>
                                                            </#if>
                                                        </#if>
                                                    </#list>
                                                    </div>
                                                </div>
                                                <input type="text" class="form-control mb-1" value="${ans.answer}"
                                                       name="${ans.answer}" id="${ans.answer_id}1" disabled/>
                                                <#if ans.corectness == true>
                                                    <input type="hidden" id="${ans.answer_id}"
                                                           name="ansRight${que.question_id}[]"/>
                                                </#if>
                                                <#if checkedAnswers??>
                                                    <#list checkedAnswers as checkedAnswer>
                                                        <#if ans.answer_id == checkedAnswer.answer_id>
                                                            <input type="hidden" id="${ans.answer_id}"
                                                                   name="ansWrong${que.question_id}[]"/>
                                                        <#--value="${checkedAnswer.corectness?c}"-->
                                                        </#if>
                                                    </#list>
                                                </#if>
                                            </div>
                                        </ul>
                                    </#if>
                                </#list>
                            <div class="form-group row">
                                <div class="col-2">
                                    <button type="button" class="btn btn-primary" id="${que.question_id}"
                                            OnClick="getAnswers${que.question_id}();"/>
                                    Ответить</button>
                                </div>
                                <div class="col-6">
                                    <input type="text" style="float: right; color: red;" readonly
                                           class="form-control-plaintext"
                                           id="nullAnswer${que.question_id}"
                                           name="num_of_questions"/>
                                </div>
                            </div>

                            <script type="text/javascript">
                                function getAnswers${que.question_id}() {

                                    var checks = [];

                                    $("input[name='check${que.question_id}[]']:checked").each(function () {
                                        checks.push($(this).attr('id'));
                                    });

                                    $("input[name='radio${que.question_id}[]']:checked").each(function () {
                                        checks.push($(this).attr('id'));
                                    });

                                    if (checks.length == 0) {
                                        //alert('Выберете ответ');
                                        $('#nullAnswer${que.question_id}').val('Выберете хотя бы 1 ответ');
                                        return;
                                    }

                                    $('#numAnswers').val(function (i, val) {
                                        $.ajax({
                                            url: '/categories/${category.categoryId}/${test.test_id}',
                                            type: 'GET',
                                            data: {
                                                checks: checks,
                                                currentQuestion: "${que.question_id}",
                                                currentStat: $('#statOfTest').val(),
                                                numOfRightAnswers: $('#numOfRightAnswers').val()
                                            },
                                            success: function (data) {
                                                //alert('Request has returned');
                                                $(data).find("input[name='ansWrong${que.question_id}[]']").each(function () {
                                                    var temp = '#' + $(this).attr('id') + '1';
                                                    $(temp).removeClass("form-control mb-1").addClass("form-control mb-1 bg-danger");
                                                });

                                                $("input[name='ansRight${que.question_id}[]']").each(function () {
                                                    var temp = '#' + $(this).attr('id') + '1';
                                                    $(temp).removeClass("form-control mb-1").addClass("form-control mb-1 bg-success");
                                                });

                                                var value = $(data).find('#statOfTest').val();
                                                var value1 = $(data).find('#numOfRightAnswers').val();
                                                $('#statOfTest').val(value);
                                                $('#${que.question_id}').prop('disabled', true);
                                                //$("input[name='check${que.question_id}[]']").prop('checked', false);
                                                $("input[name='check${que.question_id}[]']").prop('disabled', true);
                                                $('#nullAnswer${que.question_id}').val('');
                                                $('#numOfRightAnswers').val(value1);

                                                var i = $(".progress-bar").get(0).style.width;
                                                i = i.replace('%', '');
                                                var answeredQuestion = $('.progress-value > span').text();
                                                var allQuestion = ${test.num_of_questions};
                                                answeredQuestion++;
                                                i = answeredQuestion / allQuestion * 100;
                                                i = i - (i%1);
                                                var per_i = i + '%'
                                                $(".progress-bar").get(0).style.width = per_i;
                                                $(".progress-bar").text(i + " %");
                                                $('.progress-value > span').text(answeredQuestion);
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


        <div class="form-group row">
            <label class="col-sm-7 col-form-label ">Количество правильных ответов: </label>
            <input type="text" readonly class="form-control-plaintext col-sm-2" id="numOfRightAnswers"
                   value="${numOfRightAnswers}"
                   name="numAnswers"/>
        </div>

        <h3 class="progress-title">Вы ответили на</h3>
        <div class="progress-outer">
            <div class="progress">
                <div id="progressbar" class="progress-bar progress-bar-striped progress-bar-danger"
                     style="width: 0%;position: fixed;"></div>
                <div class="progress-value"><span>0</span>/${test.num_of_questions}</div>
            </div>
        </div>

    </div>

    <div class="col-1">
        <a style='position: fixed;' class="btn btn-dark my-3 ml-3 " href="/categories/${category.categoryId}">Назад</a>
    </div>

</div>

</@c.page>

