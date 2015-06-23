$(document).ready(function() {
	var calculateScore, cards, correctAnswerHandler, incorrectAnswerHandler, startNextTurn, currentCard,
	finishQuiz, numOfAttempts, scorePerCard, startTime;

	$('.start-quiz').on('click', function(e) {
		e.stopPropagation();
		e.preventDefault();
		$('.quiz').show();

		// Present Cards one at a Time
		$.ajax({ url: '/flash_cards' }).done(function(data) {

			cards = data;
			scorePerCard = 100 / cards.length;
			startNextTurn();
		});
	});

	$('#response-submit').on('click', function(e) {
		e.preventDefault();
		var userAnswer = $('#user-answer').val();

		if (currentCard.response === userAnswer) {
			correctAnswerHandler();
		} else {
			incorrectAnswerHandler();
		}
	});

	correctAnswerHandler = function() {
		$('.current-score').html(calculateScore());
		startNextTurn();
	};

	calculateScore = function() {
		var timeMultiplier, attemptsMultiplier;
		var score = scorePerCard;
		var endTime = +new Date();
		var numOfSeconds = Math.ceil((endTime - startTime)/ 1000);


		switch (numOfSeconds) {
			case numOfSeconds < 10:
				timeMultiplier = 1;
				break;
			case numOfSeconds < 20:
				timeMultiplier = .9;
				break;
			case numOfSeconds < 30:
				timeMultiplier = .8;
				break;
			default:
				timeMultiplier = .75;
		}

		switch (numOfAttempts) {
			case 0:
				attemptsMultiplier = 1;
				break;
			case 1:
				attemptsMultiplier = .75;
				break;
			default:
				attemptsMultiplier = .5;
		}

		return score * timeMultiplier * attemptsMultiplier;
	};

	incorrectAnswerHandler = function() {
		if (numOfAttempts === 3) {
			startNextTurn();
		} else {
			numOfAttempts += 1;
		}
	};

	startNextTurn = function() {
		if (cards.length) {
			// move next card to the front
			startTime = +new Date();
			numOfAttempts = 0;
			currentCard = cards.pop();
			$('.stimulus').html(currentCard.stimulus);
		} else {
			// cards are all gone, quiz is over
			finishQuiz();
		}
	};

	finishQuiz = function() {
		// TODO View the final score and the high score
		// If the new score is higher, replace the old high score
		$('.quiz').hide();
	};
});