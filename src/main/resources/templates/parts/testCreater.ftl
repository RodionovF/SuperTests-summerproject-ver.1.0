<div class="container">
    <form method="post" name="addTest" enctype="multipart/form-data">
        <div class="form-group">
            <div class="custom-file">
                <div class="container">
                    <div class="row">
                        <div class="col">
                            <input type="text" name="testname" class="form-control" placeholder="Enter the testname">
                        </div>
                        <div class="col">
                            <form class="form-inline">
                                <label>Number of questions = </label>
                                <input type="text" readonly class="form-control-plaintext" id="output3" value="1"
                                       name="num_of_questions">
                            </form>
                        </div>
                    </div>
                </div>
                <div class="form-group  my-3">
                    <input type="file" name="image1">
                    <input type="file" name="image2">
                    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                </div>


                <div class="cards">
                    <div class="form-group inputs-group mb-3">
                        <div class="row">
                            <div class="col">
                                <a class="btn btn-primary" id="id" data-toggle="collapse" href="#collapseExample"
                                   role="button"
                                   aria-expanded="false"
                                   aria-controls="collapseExample">
                                    Question editor
                                </a>
                                <span class="input-group-btn"><button type="button"
                                                                      class="btn btn-success btn-addd">Add ✚</button></span>
                            </div>
                            <div class="col">
                                <label>Number of answers = </label>
                                <input type="text" name="counter" readonly class="form-control-plaintext" id="output"
                                       value="1">
                            </div>
                        </div>

                        <div class="collapse" id="collapseExample">
                            <div class="form-group mt-3" id="form">
                                <div class="form-group mt-3">
                                    <input type="text" name="question" class="form-control"
                                           placeholder="Enter the question">
                                </div>

                                <div class="container-fluid">
                                    <div class="form-group input-group mb-3">
                                        <div class="input-group-prepend">
                                            <div class="input-group-text my-3">

                                                <input type="checkbox" name="active" value="1" aria-label="Checkbox for following text input" />
                                                <input type="hidden" value="0" name="active"/>

                                            </div>
                                        </div>
                                        <input type="text" name="answer" id="output2" class="form-control my-3"
                                               aria-label="Text input with checkbox"
                                               placeholder="Enter the answer">

                                        <span class="input-group-btn my-3"><button type="button"
                                                                                   class="btn btn-success btn-add">Add answer ✚</button></span>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="custom-file">
                                        <input type="file" name="questionimage">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <div class="form-group  my-3">
                <button type="submit" class="btn btn-dark my-3">Save test</button>
            </div>
        </div>
    </form>
</div>