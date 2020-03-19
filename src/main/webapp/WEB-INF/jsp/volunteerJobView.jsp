<%@ include file="common/header.jspf"%>
<%@ include file="common/navigation.jspf"%>

<style>
    
    .p_0 {
        padding: 0;
    }
    .v_card {
        border: 1px solid #fafafa;
        border-radius: 4px;
        margin-bottom: 20px;
        background-color: #fff;
        -webkit-box-shadow: 0 1px 4px 0 rgba(0, 0, 0, .17);
        box-shadow: 0px 1px 4px 0px rgba(0, 0, 0, .17);
    }
     .s_padding {
        padding: 10px 25px;
    }
     .v_card_body {
        padding: 15px 25px;
    }
    .volunteer_lisitng, .d_flex {
        display: flex;
    }
    .m-auto {
        margin: auto;
    }
    .v_header {
        background: #d9edf7;
        min-height: 100px;
        position: relative;
        color: #4a4a4a;
        font-size: 16px;
        font-weight: 700;
        border-radius: 4px;
    }
    .mt_60 {
        margin-top: 60px;
    }
    .v_jobTitle,
    .v_jobId {
        word-break: break-word;
    }
    .v_jobId {
        margin-left: auto;
        font-weight: 700;
        font-size: 13px;
        letter-spacing: 1px;
        text-align: right;
    }
    .field_container {
        padding: 0 0 20px 0;
    }
    .v_title {
        font-size: 14px;
        color: #999;
        font-weight: 400;
    }
    .v_content {
        font-size: 14px;
        font-weight: 700;
        color: #4a4a4a;
        margin: 0;
        overflow: hidden;
        text-overflow: ellipsis;
    }
    .v_jobDetails {
        font-size: 14px;
        color: #4a4a4a;
        margin: 0;
        overflow: hidden;
        text-overflow: ellipsis;
    }
    .clearAll {
        clear: both;
    }
</style>


<div class="volunteer_lisitng">
        <div class="col-lg-5 col-md-6 col-sm-12 col-xs-12 m-auto">
            <div class="v_card">
                <div class="v_header s_padding">
                    <p class="col-sm-12 col-lg-12 v_jobId p_0">${volunteerJob.primaryPhoneNumber} &nbsp;-&nbsp;${volunteerJob.email}</p>
                    
                    <div class="clearAll"></div>
                    <div class="row mt_60">
                        <p class="col-sm-12col-lg-12 v_jobTitle">
                            ${volunteerJob.jobTittle}</p>
                    </div>
                    <div class="clearAll"></div>
                </div>
                <div class="v_card_body  s_padding">
                    <div class="field_container p_0">
                        <p class="col-lg-12 p_0 text-right" title="">${volunteerJob.jobId}&nbsp;-&nbsp;${volunteerJob.timming}</p>
                        <div class="clearAll"></div>
                    </div>
                    <div class="field_container">
                        <label class="v_title col-lg-12 p_0">Organization </label>
                        <p class="v_content col-lg-12 p_0" title="">${volunteerJob.organisation}</p>
                        <div class="clearAll"></div>
                    </div>
                    
                    <div class="field_container">
                        <label class="v_title col-lg-12 p_0">Status </label>
                        <p class="v_content col-lg-12 p_0" title="">${volunteerJob.strStatus}</p>
                        <div class="clearAll"></div>
                    </div>
                    <div class="field_container">
                        <label class="v_title col-lg-12 p_0">Location </label>
                        <p class="v_content col-lg-12 p_0" title="">${volunteerJob.workArea}</p>
                        <div class="clearAll"></div>
                    </div>
                    <div class="field_container">
                        <label class="v_title col-lg-12 p_0">Desired Skills </label>
                        <p class="v_content col-lg-12 p_0" title="">${volunteerJob.skills}</p>
                        <div class="clearAll"></div>
                    </div>
                    <div class="field_container">
                        <label class="v_title col-lg-12 p_0">Job Details</label>
                        <p class="col-lg-12 p_0 v_jobDetails" title="">${volunteerJob.jobDetails}</p>
                        <div class="clearAll"></div>
                    </div>
                </div>
                <div class="v_footer s_padding"></div>
            </div>
        </div>
        <div class="clearAll"></div>
        </div>


<script type="text/javascript">
document.getElementById("editableJobDetails").innerHTML = document.getElementById("jobDetails").value; 

document.getElementById("pageTiteTxt").innerHTML = " COVID-19:"+document.getElementById("id_jobTittle").value; 
document.title = "COVID-19:"+document.getElementById("id_jobTittle").value;

</script>




<style>
#editableJobDetails {

min-height: 100px;
padding: 6px 12px;
    border: 1px solid #ccc;
    border-radius: 4px;
    webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
    box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
    color: #555;
    font-size: 14px;
    background: #eeeeee;
    cursor: not-allowed;
}

#editableJobDetails:focus, #editableJobDetails:active {
    border-color: #66afe9;
    outline: 0;
    -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075), 0 0 8px rgba(102,175,233,.6);
    box-shadow: inset 0 1px 1px rgba(0,0,0,.075), 0 0 8px rgba(102,175,233,.6);
}



</style>



<%@ include file="common/footer.jspf"%>