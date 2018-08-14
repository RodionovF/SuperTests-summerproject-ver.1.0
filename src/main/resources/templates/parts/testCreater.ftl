<div class="container">


    <form method="post" enctype="multipart/form-data">
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
            </div>

            <div class="form-group  my-3">
                <button type="submit" class="btn btn-dark my-3">Save test</button>
            </div>
    </form>


<#--<form method="post" enctype="multipart/form-data">-->
<#--<div class="container">-->
<#--<div class="row">-->
<#--<div class="col">-->
<#--<div class="form-group col-md-6">-->
<#--<input type="hidden" name="_csrf" value="${_csrf.token}"/>-->
<#--<label id="output1">Enter testname</label>-->
<#--<input type="text" name="testname" class="form-control" placeholder="Enter testname">-->
<#--</div>-->
<#--</div>-->

<#--<div class="col">-->
<#--<button type="submit" class="btn btn-dark my-3">Save test</button>-->
<#--<form>-->
<#--<div class="form-group row">-->
<#--<label class="col-sm-10 col-form-label">Number of question = </label>-->
<#--<div class="col-sm-10">-->
<#--<input type="hidden" name="_csrf" value="${_csrf.token}"/>-->
<#--<input type="text" readonly class="form-control-plaintext" id="output3" value="1"-->
<#--name="num_of_questions">-->
<#--</div>-->
<#--</div>-->
<#--</form>-->

<#--</div>-->
<#--</div>-->
<#--</div>-->

<#--<div class="form-group">-->
<#--<div class="form-group">-->
<#--<div class="custom-file">-->
<#--<input type="file" name="file">-->
<#--<input type="hidden" name="_csrf" value="${_csrf.token}"/>-->

<#--<input type="file" name="file" id="customFile">-->
<#--<label class="custom-file-label" for="customFile">Choose image</label>-->
<#--</div>-->
<#--</div>-->
<#--</form>-->
<#--<div class="custom-file">-->
<#--<input type="hidden" name="_csrf" value="${_csrf.token}"/>-->
<#--<input type="file" name="image_path_start" id="customFile1">-->
<#--<label class="custom-file-label" for="customFile1">Choose image for begining of test</label>-->
<#--</div>-->


</div>

    <div class="form-group">
        <div class="custom-file">
        <#--<input type="hidden" name="_csrf" value="${_csrf.token}" />-->
            <input type="file" name="image_path_end" id="customFile2">
            <label class="custom-file-label" for="customFile2">Choose image for summing up</label>
        </div>
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
                        <div class="form-group">
                            <input type="text" class="form-control${(textError??)?string('is-invalid', '')}"
                                   name="question" placeholder="Enter question"/>
                    <#if textError??>
                    <div class="invalid-feedback">
                        ${textError}
                    </div>
                    </#if>
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
                                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                                <input type="file" name="file" id="customFile">
                                <label class="custom-file-label" for="customFile">Choose image</label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</div>