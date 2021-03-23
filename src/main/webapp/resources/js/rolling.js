
var rollingNewsInterval;
var rollingTimesquareInterval;

function startRollingBanner(){
	rollingBannerInterval = setInterval(function(){
		if(!$('.rolling-box .rolling-banner').is(':animated')){
			$('.rolling-box .rolling-banner').first().animate({'margin-left':'-975.99px'},1500,function(){
				$(this).detach().appendTo('.rolling-box').removeAttr('style');
			})
		}
	},4500);
}

$(function(){
	//화면 로딩 완료후 연합뉴스 롤링
	startRollingBanner();

	$('.rolling-box .rolling-banner').hover(function(){
		//롤링 중지
		clearInterval(rollingBannerInterval);
	},function(){
		//롤링 재시작
		startRollingBanner();
	})
	
})
