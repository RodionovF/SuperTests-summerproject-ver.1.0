<div class="container">
    <form method="post" name="addTest" enctype="multipart/form-data">
        <div class="form-group">
            <div class="custom-file">
                <div class="container">
                    <div class="row">
                        <div class="col">
                            <input type="text" name="testname" class="form-control" placeholder="Enter testname">
                        </div>
                        <div class="col">
                            <form class="form-inline">
                                <label>Number of question = </label>
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
                <a class="btn btn-primary" id="id" data-toggle="collapse" href="#collapseExample" role="button"
                   aria-expanded="false"
                   aria-controls="collapseExample">
                    Question editor
                </a>
                <span class="input-group-btn"><button type="button"
                                                      class="btn btn-success btn-addd">Add ✚</button></span>


                <div class="collapse" id="collapseExample">
                    <div class="form-group mt-3" id="form">
                        <div class="form-group mt-3">
                            <input type="text" name="question" class="form-control" placeholder="question">
                        </div>

                        <div class="container-fluid">
                            <div class="form-group input-group mb-3">
                                <div class="input-group-prepend">
                                    <div class="input-group-text">
                                        <input type="checkbox" aria-label="Checkbox for following text input">
                                    </div>
                                </div>
                                <input type="text" name="multiple[]" class="form-control"
                                       aria-label="Text input with checkbox"
                                       placeholder="Enter answer">
                                <span class="input-group-btn"><button type="button"
                                                                      class="btn btn-success btn-add">Add answer ✚</button></span>

                            </div>
                        </div>

                        <div class="form-group">
                            <div class="custom-file">
                                <input type="file" name="questionimage"  placeholder="assa" value="aa">
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