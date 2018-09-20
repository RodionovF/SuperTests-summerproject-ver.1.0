<#include "parts/security.ftl">
<#import "parts/common.ftl" as c>


<@c.page>
    <#include "parts/categoryEdit.ftl" />

    <#include "parts/categoryList.ftl" />
</@c.page>

<script>
    $(document).on('change', '.fileUpload', function (event) {
        var filename = $(this).closest('.fileUpload').find('#uploadBtn').val().replace(/.*\\/, "");
        $(this).closest('.inputBtnSection').find("#uploadFile").val(filename);
    });
</script>