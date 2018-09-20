<#import "parts/common.ftl" as c>

<@c.page>
<h5>${username}</h5>
<form method="post">
    <div class="form-group row">
        <label class="col-sm-2 col-form-label">Пароль:</label>
        <div class="col-sm-6">
            <input type="password" name="password" class="form-control ${(passwordError??)?string('is-invalid', '')}"
                   placeholder="Password"/>
            <#if passwordError??>
                <div class="invalid-feedback">
                    ${passwordError}
                </div>
            </#if>
        </div>
    </div>
    <div class="form-group row">
        <label class="col-sm-2 col-form-label">E-mail:</label>
        <div class="col-sm-6">
            <input type="email" name="email" class="form-control ${(emailError??)?string('is-invalid', '')}"
                   placeholder="some@some.com" value="${email!''}"/>
            <#if emailError??>
                <div class="invalid-feedback">
                    ${emailError}
                </div>
            </#if>
        </div>
    </div>
    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
    <button class="btn btn-primary" type="submit">Сохранить</button>
</form>
</@c.page>

