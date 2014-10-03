function deleteGoal(goalId) {
	$.notify("Goal deleted", "error");
	request('DELETE', '/goals/delete/' + goalId);
}

function completedGoal(goalId) {
	$.notify("Goal completed", "success");
	request('POST', '/goals/completed/' + goalId);
}

function request(type, url) {
	$.ajax({
		url: url,
		type: type,
		success: function (info) {
			console.info(info);
		}
	});
}