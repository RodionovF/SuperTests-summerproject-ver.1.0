<div class="row">

    <div class="col-11">
        <div class="container">
            <form method="post" name="addTest" enctype="multipart/form-data">
                <div class="form-group">
                    <div class="custom-file">

                        <div class="form-group row">
                            <label class="col-sm-3 col-form-label ">Имя теста:</label>
                            <div class="col-sm-6">
                                <input type="text" name="testname" placeholder="Enter the testname"
                                       class="col-sm-6 form-control ${(testnameError??)?string('is-invalid', '')}"/>
                        <#if testnameError??>
                            <div class="invalid-feedback">
                                ${testnameError}
                            </div>
                        </#if>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label class="col-sm-3 col-form-label">Количество вопросов в тесте:</label>
                            <div class="col-sm-1">
                                <input type="text" readonly class="form-control-plaintext" id="output3" value="1"
                                       name="num_of_questions"/>
                            </div>
                        </div>

                        <div class="form-group my-3">
                            <div class="form-group row">
                                <label class="col-sm-3 col-form-label">Начальное изображение:</label>
                                <div class="col-sm-6">
                                    <div class="inputBtnSection">
                                        <input id="uploadFile" class="disableInputField" placeholder="Choose File"
                                               disabled="disabled"/>
                                        <label class="fileUpload">
                                            <input name="image1" id="uploadBtn" type="file" class="upload"/>
                                            <span class="uploadBtn">Выбрать файл ...</span>
                                        </label>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label class="col-sm-3 col-form-label">Изображение после теста:</label>
                                <div class="col-sm-6">
                                    <div class="inputBtnSection">
                                        <input id="uploadFile" class="disableInputField" placeholder="Choose File"
                                               disabled="disabled"/>
                                        <label class="fileUpload">
                                            <input name="image2" id="uploadBtn" type="file" class="upload"/>
                                            <span class="uploadBtn">Выбрать файл ...</span>
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                        </div>

                        <div class="cards">
                            <div class="card my-3">
                                <div class="form-group inputs-group">
                                    <div class="row ml-2 mt-3">
                                        <div class="col-sm-5">
                                            <a class="btn btn-primary" id="id" data-toggle="collapse"
                                               href="#collapseExample" role="button"
                                               aria-expanded="false" aria-controls="collapseExample">
                                                Редактор вопроса
                                            </a>

                                            <span class="input-group-btn">
                                                <button type="button" class="btn btn-success btn-addd">
                                                    Добавить вопрос ✚
                                                </button>
                                            </span>
                                        </div>

                                        <label class="col-sm-3 col-form-label">
                                            Количество ответов на вопрос:
                                        </label>

                                        <input type="text" name="counter" readonly
                                               class="col-sm-1 form-control-plaintext"
                                               id="output" value="1">
                                    </div>

                                    <div class="collapse" id="collapseExample">
                                        <div class="form-group mt-3" id="form">

                                            <div class="form-group row ml-5 mt-3">
                                                <label class="col-sm-2 col-form-label ">
                                                    Вопрос:
                                                </label>
                                                <div class="col-sm-6">
                                                    <input type="text" name="question" placeholder="Enter the question"
                                                           id="quest[]"
                                                           class="form-control ${(questionError??)?string('is-invalid', '')}"
                                                           value=" "/>
                                                    <#if questionError??>
                                                        <div class="invalid-feedback">
                                                            ${questionError}
                                                        </div>
                                                    </#if>
                                                </div>
                                            </div>

                                            <div class="col-sm-8 container-fluid ml-5" id="output4">
                                                <div class="form-group input-group">
                                                    <div class="input-group-prepend">
                                                        <div class="input-group-text my-3">

                                                            <input type="checkbox" name="active" id="output1" value="1"
                                                                   aria-label="Checkbox for following text input"/>
                                                            <input type="hidden" value="0" name="active"/>

                                                        </div>
                                                    </div>
                                                    <input type="text" name="answer" id="output2"
                                                           class="form-control my-3 ${(answerError??)?string('is-invalid', '')}"
                                                           aria-label="Text input with checkbox"
                                                           placeholder="Enter the answer" value=" ">

                                                    <span class="input-group-btn my-3">
                                                        <button type="button" class="btn btn-success btn-add">
                                                            Добавить ответ ✚
                                                        </button>
                                                    </span>
                                                    <#if answerError??>
                                                        <div class="invalid-feedback">
                                                            ${answerError}
                                                        </div>
                                                    </#if>
                                                </div>
                                            </div>

                                            <div class="form-group row ml-5">
                                                <label class="col-sm-3 col-form-label">
                                                    Изображение для вопроса:
                                                </label>
                                                <div class="col-sm-6">
                                                    <div class="inputBtnSection">
                                                        <input name="uploadFile" id="uploadFile"
                                                               class="disableInputField"
                                                               placeholder="Choose File"
                                                               disabled="disabled"/>
                                                        <label class="fileUpload">
                                                            <input name="questionimage" id="uploadBtn" type="file"
                                                                   class="upload"/>
                                                            <span class="uploadBtn">Выбрать файл ...</span>
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group  my-3">
                            <button type="submit" class="btn btn-dark my-3">
                                Сохранить тест
                            </button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <div class="col-1">
        <a class="btn btn-dark " href="/categories/${category.categoryId}">
            Назад
        </a>
    </div>

</div>