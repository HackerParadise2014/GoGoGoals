function deleteGoal(goalId) {
	request('DELETE', '/goals/delete/' + goalId);
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