function DoUserUpdate() {document.update_user.submit();}
function DoShiftUpdate() {document.update_shift.submit();}
function DoDepartmentUpdate() {document.update_department.submit();}
function DoScheduleUpdate() {document.schedule_form.submit();}


$(document).ready(
function () {

	$("#datepicker_schedule_from").datepicker({ dateFormat: "d/m/yy" });
    $("#datepicker_schedule_from").datepicker( "option", "firstDay", 1 );
   
    $("#datepicker_schedule_to").datepicker({ dateFormat: "d/m/yy" });
    $("#datepicker_schedule_to").datepicker( "option", "firstDay", 1 );

    $('.userbox form').on('submit',  function(ev) {

    	ev.preventDefault();
    	
    	var idVal = $(this).find('.id').val();

        $.post("schedule_management.php?ajax=true", { id : idVal }, function (data) {
            $("#" + idVal + ".userbox").remove();
            $("#" + idVal + ".user_data").css('background-color', '#FFFFFF');

        }
    );

    });

});