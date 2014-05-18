var bgleft=0;
var wid, hei , f=0,fl=0,pf=0,pfl=0,ff=0;
var cur_page=0;
var dura=200;	
var tophei=0,radius;
var minwid=1200;
var minhei=500;
var cur_gr=1;
var pre,timer;
var cur_pr=1;
var cur_prnum=0;
var lang=0,l,w,t,tfl=0,cnt=0,conti=0;
var fhei,s1,s2,s3,s4,len1,len2,len3,len4,glassTimer;
$(function(){
    
    $('#moff').click(function(){
        if($('#moff').hasClass('mon')){
            document.getElementById('puzzle_mus').play();
            $('#moff').removeClass('mon');
        }
        else{
            document.getElementById('puzzle_mus').pause();
            $('#moff').addClass('mon');
        }
    });
	$(window).resize(function(){
		$.fn.initial();
	});
        logged=$('#logged').html();	
        
            conti=logged;
        wid=window.innerWidth;
        hei=window.innerHeight;
	cur_page=0;
	pre=$('#pre').html();
	var arr1=new Array();
        var arr2=new Array();
        var arr3=new Array();
        var title=new Array();
        var desc=new Array();
        arr1[0]='#8EC124';
        arr1[1]='#B98ABE';
        arr1[2]='#F37F8C';
        arr1[3]='#43C0EE';
        arr1[4]='#F69200';
        arr2[0]='#00FEFC';
        arr2[1]='#AEFF00';
        arr2[2]='#013766';
        arr2[3]='#FFC2E3';
        arr2[4]='#542C13';
        arr3[0]='#3E8D24';
        arr3[1]='#614784';
        arr3[2]='#A61C3D';
        arr3[3]='#0071BF';
        arr3[4]='#603814';
        title[0]='جورچین';
        title[1]='رنگ آمیزی';
        title[2]='داستان';
        title[3]='آموزش';
        title[4]='آشپزی';
        desc[0]='دوست داری جورچین حل کنی؟';
        desc[1]='!یه دنیا رنگ اینجاست';
        desc[2]=' !داستانای خوب برای بچه ها';
        desc[3]='دوس داری چیزای جدید یاد بگیری؟';
        desc[4]='!یه عالمه غدای خوش مزه';
        $.fn.shortIn=function(){
            $('#shortlogin').fadeIn(300);
            $('#kid').addClass('fixed');
 
        }
        $.fn.shortOut=function(){
            $('#shortlogin').fadeOut(300); 
                $('#kid').removeClass('fixed');
            
        }
        
	$.fn.center=function(str,w){
		if(w==0)
			$(str).css('left',(wid-parseInt($(str).css('width')))/2);
		else
			$(str).css('left',(wid-w)/2);
		
	}
        
	$.fn.centerVertical=function(str,h){
		if(h==0)
			$(str).css('top',(hei-parseInt($(str).css('height')))/2);
		else	
			$(str).css('top',(hei-h)/2);
	}
        function showeye(){
            $('#kid_eye').removeClass('nobg');
        }
        function kidBlink(){
            $('#kid_eye').addClass('nobg');
            setTimeout(showeye,100);
        }
	function kidAnimate(){
             
            $('#kid').stop().animate({bottom:b1},1000 ,'easeOutQuad', function(){
                 $('#kid').animate({bottom:b2},1000,'easeOutQuad' );
            })
        }
        
        function showeye(){
            $('#dad_eye').removeClass('nobg');
        }
        function kidBlink(){
            $('#dad_eye').addClass('nobg');
            setTimeout(showeye,100);
        }
	function kidAnimate(){
             
            $('#dad_con').stop().animate({bottom:b1},1000 ,'easeOutQuad', function(){
                 $('#dad_con').animate({bottom:b2},1000,'easeOutQuad' );
            })
        } 
        $('#dad_con').hover(function(){
            clearInterval(kidTimer);
            $('#dad_con').stop().animate({bottom:-60},300);
        },function(){
            kidAnimate();
            kidTimer=setInterval(kidAnimate,2000);
        });
        $('#bed_ar').click(function(){
            $('#bedtime').fadeOut(500);
        });
        langg=1;
        $('#en').click(function(e){
            langg=1;
            
            var today=new Date();
            var h=today.getHours();
            var m=today.getMinutes();
            var s=today.getSeconds();
            // add a zero in front of numbers<10
            m=checkTime(m); 
            if(h>12){
                h=h-12;
            }
            $('#bed_colok').html((h+':'+m));
            
            $('#nav_txt').html('<span class="fonte ">To navigate this website you can<span>');
            $('#mouse_txt').html('<span class="fonte ">Scroll<span>');
            $('#key_txt').html('<span class="fonte ">Use keyboard<span>');
            $('#nav_cont').html('<span class="fonte ">Continue<span>');
            h=today.getHours();
            e.preventDefault();
            if(h>=night || h<=5){
                $('#bed_sleep').html('Its time to sleep!').addClass('fonte').removeClass('bedf');
                $('#bed_oh').html('o...Oh...!').addClass('fonteb').removeClass('bedf');
                $('#permit').html('I\'m permitted by my parents!').addClass('fonte').removeClass('bedp');
                 
                $('#bedtime').fadeIn(500);
            }else{
                $('#navigate').fadeIn();
                nav();
            }
            //$('#permit').click(function(){window.location='en';});
        });
        $('#permit').click(function(){
            $('#bed_con').fadeOut();
            $('#navigate').fadeIn();
            nav();
        });
        $('#fa').click(function(e){
            langg=0;
            var today=new Date();
            var h=today.getHours();
            var m=today.getMinutes();
            var s=today.getSeconds();
            // add a zero in front of numbers<10
            m=checkTime(m); 
            if(h>12){
                h=h-12;
            }
            $('#bed_colok').html((h+':'+m));
            
            $('#nav_txt').html('لتصفح الموقع يمكنك');
            $('#mouse_txt').html('استخدام الفأرة');
            $('#key_txt').html('استخادم لوحة المفاتيح');
            $('#nav_cont').html('استمر');
            h=today.getHours();
            e.preventDefault();
            if(h>=night || h<=5){
                $('#bed_sleep').html('وقت خوابه!').removeClass('fonte').addClass('bedf');
                $('#bed_oh').html('نه نه نه!').removeClass('fonteb').addClass('bedf');
                $('#permit').html('اجازه مامان بابامو دارم').removeClass('fonte').addClass('bedp');
                
                $('#bedtime').fadeIn(500);
            }
            else{
                $('#navigate').fadeIn();
                nav();
            }
            //$('#permit').click(function(){window.location='fa';});
        });
        
        $('#nav_cont, #navigate').click(function(){
            if(langg==1){
                window.location='kids.html';
            }else{
                window.location='kids.html';
            }
            //$('#navigate').fadeOut(300);
        });
        function nav(){
            dd=1000;
            setTimeout(function(){
                $('#mouse').addClass('navp1');
            },dd);
            setTimeout(function(){
                $('#mouse').removeClass('navp1');
                $('#key2').addClass('navp2');
            },2*dd);
            setTimeout(function(){
                $('#key2').addClass('navp3').removeClass('navp2');
            },3*dd);
            setTimeout(function(){
                $('#key2').addClass('navp4').removeClass('navp3');
            },4*dd);
            setTimeout(function(){
                $('#key2').addClass('navp5').removeClass('navp4');
            },5*dd);
            setTimeout(function(){
                $('#key2').removeClass('navp5');nav();
            },6*dd); 
        }
	$.fn.initial=function(){
            var today=new Date();
            var month=today.getMonth();
             switch (month){
                    case 1:night=17;
                    case 2:night=18;
                    case 3:night=19;
                    case 4:night=19;
                    case 5:night=19;
                    case 6:night=20;
                    case 7:night=20;
                    case 8:night=21;
                    case 9:night=20;
                    case 10:night=19;
                    case 11:night=19;
                    case 12:night=18;
                }
                
                night=22;
            b1=-200;
            b2=-160;
            kidAnimate();
            
            //$('#hour').html(h); 
            
            
                var today=new Date();
                var h=today.getHours();
                
                if((h>19||h<6)){
                   $('#mainBody').addClass('night');
                    $('#clouds').hide();
                    $('#pingu_svg2').css('opacity',1);
                }
                else{
                    $('#pingu_svg1').css('opacity',1);
                    $('#lala').hide();
                }
                $('#part_title').html(title[0]);
                $('#part_desc').html(desc[0]);
                    
		wid=window.innerWidth;
		hei=window.innerHeight;
                radius=Math.sqrt((hei*hei+(wid/2)*(wid/2)));
                fhei=1.1*hei;
		if(wid<minwid)
			wid=minwid;
		if(hei<minhei)
			hei=minhei; 
                $('#mainBody').css('width',wid);
                $('#menu_page').css('width',wid);
                $('#dwn_btn').css('left',(wid-66)/2);
                //$("#pingu_txt" ).draggable(); 
                 
                $('#dad').css('width',(wid)/2);
                $('#glass').css('right',(wid)/2+0);
                $('#sand').css('bottom',(hei)/2-110);
                $('#sand').css('right',(wid)/2+0);
                
                $('#menu_num').css('left',(wid)/2-500);
                $('#menu_num').css('top',(hei-100)/2-10);
                $('#kid').css('left',(wid-537)/2);
                //$('#first_foot').css('left',(wid-249)/2);
                kidTimer=setInterval(kidAnimate,2000);
                setInterval(kidBlink,2630);
                $('#dwn_btn').css('left',(wid-66)/2);
                //$('#dwn_btn').css('bottom',(hei-204)/4-50);
        }
        $('.pics').css('opacity','0').filter('.pics:eq(0)').css('opacity','1');
        $('#plus,#part_title,#part_desc').hover(function(){
            $('#light').addClass('light_on');
        },function(){
            $('#light').removeClass('light_on');
        });
	$('#plus').click(function(){
            if(cur_page==0)
                window.location=pre+'kids/puzzle';
            else if(cur_page==1)
                window.location=pre+'kids/color';
            else if(cur_page==3)
                window.location=pre+'kids/learning';
        });
        $('.itemnum:eq(0)').addClass('item1hover');
            
        $('#part_desc').css('color',arr3[0]);
        /*$("#pingu_txt" ).drag(function(){
            alert('sd');
        });*/   $('.cir:eq('+cur_page+')').stop().animate({top:-4,left:cur_page*70-4,height:60,width:60 },100); 
            
        $.fn.gotopage=function(pag){
            if(cur_page==pag){
                return;
            }
            fl=1;
            $('.cir:eq('+cur_page+')').stop().animate({top:-1,left:cur_page*70-1,height:54,width:54},100);   
             
            cur_page=pag;
            $('.cir:eq('+cur_page+')').stop().animate({top:-4,left:cur_page*70-4,height:60,width:60 },100); 
            
            $('.itemnum:eq('+cur_page+')').removeClass('item'+(cur_page+1)+'hover');
            $('.itemnum:eq('+pag+')').addClass('item'+(pag+1)+'hover');
            durr=300;
            //setTimeout(,3000);
            $('#right_hand').css('transformOrigin', '0 120%').animate({rotate:1.57,opacity:0},durr*2,'easeInQuint'
                ,function(){  
                    $('#menu_bg2').css('background-color',arr1[pag]).stop().animate({opacity:1},durr*1.5,function(){
                $('#menu_bg1').css('background-color',arr1[pag]);
                $('#menu_bg2').css('opacity',0);
            });
                    $('#part_title').html(title[pag]);
                    $('#part_desc').html(desc[pag]);
                    $('#part_desc').css('color',arr3[pag]);
                    
            $('#right_hand').css({'transformOrigin':'0 120%','opacity':'1'}).animate({rotate:-.1},durr*.8,function(){
                        $('#right_hand').css('transformOrigin', '0 120%').animate({rotate:.05},durr*.6,function(){
                            $('#right_hand').css('transformOrigin', '0 120%').animate({rotate:-.02},durr*.4,function(){
                                $('#right_hand').css('transformOrigin', '0 120%').animate({rotate:.01},durr*.3,function(){
                                    $('#right_hand').css('transformOrigin', '0 120%').animate({rotate:0},durr*.2)
                                })
                            }) 
                        })
                    });        
             }
                );
            $('#left_hand').css('transformOrigin', '100% 120%').animate({rotate:-1.57,opacity:0},durr*2,'easeInQuint'
                ,function(){
                     
                    $('#menu_num').html((pag+1));
                    $('#menu_num').css('color',arr2[pag]);
                    
                    $('.pics').css('opacity','0').filter('.pics:eq('+pag+')').css('opacity','1');
                    
                    $('#left_hand').css({'transformOrigin':'100% 120%','opacity':'1'}).animate({rotate:.1},durr*.8,function(){
                        $('#left_hand').css('transformOrigin', '100% 120%').animate({rotate:-.05},durr*.6,function(){
                            $('#left_hand').css('transformOrigin', '100% 120%').animate({rotate:.02},durr*.4,function(){
                                $('#left_hand').css('transformOrigin', '100% 120%').animate({rotate:-.01},durr*.3,function(){
                                    $('#left_hand').css('transformOrigin', '100% 120%').animate({rotate:0},durr*.2,function(){fl=0;})
                                })
                            })
                        })
                    });
                }
                );
            if(pag==3){
                startGlass();
            }
            else{
                endGlass();
            }
            if(pag==4){
                startSand();
            }
            else{
                endSand();
            }
        }
         
        
        $('.circles').each(function(index, element) {
            $(this).hover(function(){
              
                $('.cir:eq('+index+')').stop().animate({top:-4,left:index*70-4,height:60,width:60 },100); 
            },function(){
                if(index!=cur_page){
                    $('.cir:eq('+index+')').stop().animate({top:-1,left:index*70-1,height:54,width:54},100);     
                }
            });
        });
        
        $('.button').each(function(index, element) {
            $(this).hover(function(){
                $(this).stop().animate({opacity:1},300);
                    },function(){
                            $(this).stop().animate({opacity:0.5},300);
                    });
        });
        $('.button2').each(function(index, element) {
            $(this).hover(function(){
                $(this).stop().animate({opacity:0.6},300);
                    },function(){
                            $(this).stop().animate({opacity:0.2},300);
                    });
        });
        $('#left_btn').click(function(){
            if(fl==1)
                return;
            if(cur_page>0)
                $.fn.gotopage(cur_page-1)();
        });
        $('#right_btn').click(function(){
            if(fl==1)
                return;
            if(cur_page<4)
                $.fn.gotopage(cur_page+1)();
        });
        $('#dwn_btnn').click(function(){
             movedown();
        });
        $('#kid').hover(function(){
            clearInterval(kidTimer);
            $('#kid').stop().animate({bottom:-60},300);
        },function(){
            kidAnimate();
            kidTimer=setInterval(kidAnimate,2000);
        });
        $('.btn').each(function(index, element) {
                $(this).hover(function(){
                        $('.btnn',this).stop().fadeTo(200,0);
                },function(){
                        $('.btnn',this).stop().fadeTo(200,1);
                });
        });
		//
        $('.btn2').each(function(index, element) {
                $(this).hover(function(){
                        
                        $('.btnh2',this).stop().fadeTo(200,1);
                },function(){
                        $('.btnh2',this).stop().fadeTo(200,0);
                });
        });
        $('.circles').each(function(index, element) {
                $(this).click(function(){
                   //$('.cir:eq('+cur_page+')').stop().animate({top:-1,left:index*90-1,height:76,width:76},100,'easeOutElastic');
                   $.fn.gotopage(index);
                });
                
        });
        $('.ar').each(function(index, element) {
                $(this).click(function(){
                    
                   $('.cir:eq('+cur_page+')').stop().animate({top:-1,left:index*90-1,height:76,width:76},100,'easeOutElastic');
                   $.fn.gotopage(index);
                });
                $(this).hover(function(){
                        
                    $('.itemnum:eq('+index+')').addClass('item'+(index+1)+'hover');
                },function(){
                    if(index!=cur_page)
                        $('.itemnum:eq('+index+')').removeClass('item'+(index+1)+'hover');
                    
                });
        });
        $('#lala').click(function(){
            $("#jquery_jplayer_1").jPlayer("play");
            
            /*a1=document.getElementById('a1');
            if (a1.paused) {
                a1.play();
            }
            else{
                a1.pause();
            }*/
        });
        $('#signup').click(function(){
            
            window.location=(pre+'wizard');
        });
        
        $('#continue').click(function(){
            conti=1;
            $.fn.shortOut();
            movedown();
        });
        
        $('#short_a').click(function(){
            $.fn.shortOut();
            $('body,html').stop().animate({scrollTop:(0)},0);
        });
        $('#login_btn2').click(function(){
            var str=(pre+"users\/ajaxLogin"); 
            $.ajax({beforeSend:function (XMLHttpRequest) {
                    /*----start beforeSend-----*/
                    /*----end beforeSend-----var spinner = new Spinner().spin();*/
                },

                data:$("#loginformid2").closest("form").serialize(),
                dataType:"html",
                success:function (data, textStatus) {
                        /*----start success-----*/

                        if(data=='0'){
                            $('#u_box').val('');
                            $('#p_box').val('');

                        }
                        else{
                             $('#temp').html(data);
                        
                            $('#st1').hide();
                            $('#st2').show();
                            conti=1;
                            $.fn.shortOut();
                            movedown();
                            $('#logged').html('1');
                        }
                        /*----end success-----*/

                },
                type:"post",
                url:str
            });
        });
	$(document).ready(function(){
		$.fn.initial();
		// $('body,html').animate({scrolltop:1},100,function(){
			// $('body,html').animate({scrolltop:0},1);
		// });
                startTime();
                //alert((pre+"music/a2.mp3"));
                /*$("#jquery_jplayer_1").jPlayer({
                ready: function () {
                  $(this).jPlayer("setMedia", {
                  
                   mp3: (pre+"music/a2.mp3"),
                   ogg: (pre+"music/a2.ogg") 
                     
                  });
                },
                swfPath: (pre+"js"),
                supplied: "mp3, ogg",
                cssSelectorAncestor: "",
                cssSelector: {
                  play: "#dwn_1btn",
                  pause: "#a",
                  stop: "#dwan_btn",
                  mute: "#mute",
                  unmute: "#unmute",
                  currentTime: "#currentTime",
                  duration: "#duration"
                },
                size: {
                  width: "320px",
                  height: "180px"
                }
              });*/
	}); 
        function startTime()
        {
            var today=new Date();
            var h=today.getHours();
            var m=today.getMinutes();
            var s=today.getSeconds();
            // add a zero in front of numbers<10
            m=checkTime(m); 
            if(h>12){
                h=h-12;
            }
            $('#bed_colok').html((h+'<span style="font-size:99px;"> </span>'+m));
            setTimeout(function(){$('#bed_colok').html((h+':'+m));},400); 
            
            t=setTimeout(function(){startTime()},1000);
        }

        function checkTime(i)
        {
        if (i<10)
          {
          i="0" + i;
          }
        return i;
        }
        $('#continue').click(function(){
            
        });
        function moveup(){
            if(fl==1)
                return;
            var topp=$(window).scrollTop();
		
            //if(conti==1){
            
            if(topp==hei ){
                if(cur_page==0)
                    $('body,html').stop().animate({scrollTop:(0)},1300,"easeInOutQuint");
                else
                     $.fn.gotopage(cur_page-1);
            } 
            //}
           // else{
                
            //}    
                    
        }
        function movedown(){
            if(fl==1)
                return;
            var topp=$(window).scrollTop();
            
            if(conti==1){
                if(topp<hei){
                    $('body,html').stop().animate({scrollTop:(hei)},1300,"easeInOutQuint");
                }
                else{
                    if(cur_page<4)
                        $.fn.gotopage(cur_page+1);
                }
            }
            else{
                $.fn.shortIn();
            }
        }
        $(window).mousewheel(function(e, delta) {
		
		if(delta>0)//up
		{
                    moveup();
                    e.preventDefault();
		}
		else//down
		{
                    movedown();
                    //$.fn.shortIn();
                    e.preventDefault();
		}
		  
	}); 
        f1=0;
        f2=0;
        $('#dadf').stop().animate({rotate:-1.8},20);
        $('#sonf').stop().animate({rotate:1.8},20);
        $(window).mousemove(function(e){ 
            x=e.clientX;
            di=wid/2-x;
            //if(di<0){di=di*-1}
            if(di>250){
                x=wid/2-250;
            }
            else if(di<-250){
                x=wid/2+250;
            }
            $('#dad').stop().animate({width:(wid-x)},350 );
            if(x<wid/2){
                if(f1==0){
                    f1=1;
                    f2=0;
                    $('#dadf').stop().animate({rotate:0},1000,'easeOutElastic');
                    $('#sonf').stop().animate({rotate:1.8},250);
                }
            }else{
                if(f2==0){
                    f1=0;
                    f2=1;
                    $('#dadf').stop().animate({rotate:-1.8},250);
                    $('#sonf').stop().animate({rotate:0},1000,'easeOutElastic');
                }
            }
                
        });
        $('#son ,#sonf').click(function(){
            aaa=parseInt($('#dad').css('width'));
            ttmp=( aaa-695+( (695/2)- aaa+(wid/2)+1  ) );
            $('#dad').addClass('dadbg');
            $('#dad').css('background-position-x',(ttmp+'px'));
            $('#page1').animate({left:-wid},1000,'easeOutExpo');
            setTimeout(function(){$('#home').animate({left:0},700,'easeOutExpo');},300);
            $('#lang').animate({left:0},1000,'easeOutExpo');
        });
        $('#dad ,#dadf').click(function(){
            aaa=parseInt($('#dad').css('width'));
            ttmp=( aaa-695+( (695/2)- aaa+(wid/2)+1  ) );
            $('#dad').addClass('dadbg');
            $('#dad').css('background-position-x',(ttmp+'px'));
            //alert(ttmp);
             $('#page1').stop().animate({left:wid},1000,'easeOutExpo');
            setTimeout(function(){$('#home2').animate({right:0},700,'easeOutExpo');},300);
       
            $('#lang2').stop().animate({left:0},1000,'easeOutExpo');
            //window.location=(pre+'parents/articles');
       });
        
        $('#home').click(function(){
            $('#page1').stop().animate({left:0},1000,'easeOutExpo',function(){
                $('#dad').removeClass('dadbg');
            });
            $('#home').stop().animate({left:-90},200,'easeOutExpo');
            $('#lang').stop().animate({left:wid},1000,'easeOutExpo');
             
        });
        $('#home2').click(function(){
            $('#page1').stop().animate({left:0},1000,'easeOutExpo',function(){
                $('#dad').removeClass('dadbg');
            });
            $('#home2').stop().animate({right:-90},200,'easeOutExpo');
            $('#lang2').stop().animate({left:-wid},1000,'easeOutExpo'); 
        });
        
        $(window).scroll(function(){
            
        });
	$(window).keydown(function(e){
		  
		if(e.keyCode==49 )//1
		{

				//var cl = new CanvasLoader('bord');

		}
		else if(e.keyCode==81)//q
		{
			//alert(cur_page);//alert(window.innerHeight+","+window.innerWidth);
		}
		else if(e.keyCode==13)//enter
		{
			 
		}
                
		else if(e.keyCode==38|| e.keyCode==33|| e.keyCode==37)//up
		{ 
                    moveup();
                    e.preventDefault();
		}
		else if(e.keyCode==40|| e.keyCode==34|| e.keyCode==39)//down
		{ 
                    movedown();
                    e.preventDefault();
		}
		else if(e.keyCode==36)//home
		{ 
			 e.preventDefault();
		}
		else if(e.keyCode==35)//end
		{ 
			 e.preventDefault();			
		}
		else if(e.keyCode==27)//Esc
		{
                    
		}
        });
        
    $('#sitemap_btn').click(function(){
        $('#sitemap').animate({bottom:0},500,'easeOutExpo');
    });
    $('#sitemap').hover(function(){},function(){ 
        $('#sitemap').animate({bottom:-220},500,'easeOutExpo');
    });
})

