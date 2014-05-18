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
var night=19;
var fhei,s1,s2,s3,s4,len1,len2,len3,len4,glassTimer;
$(function(){
        $('#nav_cont').click(function(){
            $('#navigate').fadeOut(300);
        });
        logged=$('#logged').html();	
        
        conti=logged;
        wid=window.innerWidth;
        hei=window.innerHeight;
	cur_page=0;
	pre=$('#pre').html();
	lang=$('#lang').html(); 
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
        if(lang=='fa'){
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
        }else{
            title[0]='Puzzle';
            title[1]='Painting';
            title[2]='Gallery';
            title[3]='Survey';
            title[4]='Drag And Drop';
            desc[0]='Do you like solve puzzles?';
            desc[1]='There are lots of colors here!';
            desc[2]='Nice Photos for lovely kids!';
            desc[3]='Do you like learning new things?';
            desc[4]='';
        }
        
        $.fn.shortIn=function(){
            $('#shortlogin').fadeIn(300);
            $('#kid').addClass('fixed');
            $('#minute').addClass('coloo');
            $('#comehere').fadeIn(300); 
        }
        $.fn.shortOut=function(){
            $('#shortlogin').fadeOut(300); 
            $('#comehere').fadeOut(300); 
            $('#kid').removeClass('fixed');
            $('#minute').removeClass('coloo'); 

            $('#clock').removeClass('coloo'); 
            
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
        /*function swingGlass(){
            
            if(cur_page==4){
                clearInterval(glassTimer);
                $('#glass').stop().animate({rotate:2},700,'easeInOutQuad');
            }
            else{
                $('#glass').animate({rotate:.05},1000,'easeInOutQuad',function(){
                    $('#glass').animate({rotate:-.05},1000,'easeInOutQuad')
                }); 
            }
           
        }*/
        sw1=0;
        sw2=0;
        function startGlass(){
            $('#glass').css({'transformOrigin':'60% 0','opacity':'1','rotate':'1.57'}).animate({rotate:-.05},1000,function(){
                sw1=1;
                swingGlass();
            });
        }
        function endGlass(){
            sw1=0;
            $('#glass').stop().animate({rotate:2},700,'easeInOutQuad');;
            setTimeout(function(){$('#glass').stop().animate({rotate:2},700,'easeInOutQuad');},100); 
        }
        function swingGlass(){
             if(sw1==1){
                $('#glass').animate({rotate:.05},1000,'easeInOutQuad',function(){
                    if(sw1==1){
                        $('#glass').animate({rotate:-.05},1000,'easeInOutQuad');
                    }
                    swingGlass();
                }); 
            }
        } 
        function swingSand(){
            if(sw2==1){
                $('#sand').animate({rotate:.05},1000,'easeInOutQuad',function(){
                    if(sw2==1){
                        $('#sand').animate({rotate:-.05},1000,'easeInOutQuad');
                    }
                    swingSand();
                }); 
            }
        }
        function startSand(){
            $('#sand').css({'transformOrigin':'60% 0','opacity':'1','rotate':'1.57'}).animate({rotate:-.05},1000,function(){
                sw2=1;
                swingSand();
            });
        }
        function endSand(){
            sw2=0;
            $('#sand').stop().animate({rotate:2},700,'easeInOutQuad');;
            setTimeout(function(){$('#sand').stop().animate({rotate:2},700,'easeInOutQuad');},100); 
        }
        
        
        var i=0;
        var j=0;
	$.fn.initial=function(){
            cururl=(window.location.href);
            for(i=0;cururl[i];i++){
                if(cururl[i]=='#'){
                    conti=1;
                    switch(cururl[i+2]){
                        case 'u':j=0;$.fn.gotopage1(0);break;
                        case 'a':j=1;$.fn.gotopage1(1);break;
                        case 't':j=2;$.fn.gotopage1(2);break;
                        case 'e':j=3;$.fn.gotopage1(3);break;
                        case 'o':j=4;$.fn.gotopage1(4);break;
                    }
                    break;
                }
            }
            $('#part_title').html(title[j]);
            $('#part_desc').html(desc[j]);
            b1=-200;
            b2=-160;
            kidAnimate();
                var today=new Date();
                var h=today.getHours(); 
                var mon=today.getMonth(); 
                switch (mon){
                    case 1:night=17;break;
                    case 2:night=18;break;
                    case 3:night=19;break;
                    case 4:night=19;break;
                    case 5:night=19;break;
                    case 6:night=20;break;
                    case 7:night=20;break;
                    case 8:night=21;break;
                    case 9:night=20;break;
                    case 10:night=19;break;
                    case 11:night=19;break;
                    case 12:night=18;break;
                }
                if((h>=night||h<6)){
                    $('#mainBody').addClass('night');
                    $('#clouds').hide();
                    $('#clouds2').show();
                    $('#pingu_svg2').css('opacity',1);
                }
                else{
                    $('#pingu_svg1').css('opacity',1);
                    $('#clouds2').hide();
                    $('#clouds').show();
                }
                     
		wid=window.innerWidth;
		hei=window.innerHeight;
                radius=Math.sqrt((hei*hei+(wid/2)*(wid/2)));
                fhei=1.1*hei;
		if(wid<minwid)
			wid=minwid;
		if(hei<minhei)
			hei=minhei; 
                $('#mainBody').css('width',wid);
                $('#menu').css('width',wid);
                $('#dwn_btn').css('left',(wid-66)/2);
                //$("#pingu_txt" ).draggable(); 
                $('#pingu_txt').css('left',(wid-1000)/2+80);
                $('#pingu_txt').css('top',(hei-304)/2+50);
                $('#pingu_svg1').css('right',(wid-1100)/2-10);
                $('#pingu_svg1').css('bottom',(hei-104)/2-360);
                $('#pingu_svg2').css('right',(wid-1100)/2-30);
                $('#pingu_svg2').css('bottom',(hei-104)/2-360);
                $('#clouds').css('right',(wid-1000)/2+150);
                $('#clouds').css('bottom',(hei-104)/2+130);
                $('#clouds2').css('right',(wid-1000)/2+150);
                $('#clouds2').css('bottom',(hei-104)/2+130);
                $('#left_btn').css('top',(hei-150)/2);
                $('#right_btn').css('top',(hei-150)/2);
                $('#part_title').css('top',(hei-110)/2-5);
                $('#part_desc').css('top',(hei-110)/2+75);
                $('#part_title').css('right',(wid)/2-300);
                $('#part_desc').css('right',(wid)/2-300);
                $('#plus').css('right',(wid)/2-430);
                $('#plus').css('top',(hei-120)/2-10);
                $('#light').css('top',(hei-282)/2-20);
                $('#window').css('top',(hei-310)/2-50);
                $('#color').css('top',(hei-271)/2-190);
                $('#food').css('top',(hei-291)/2+10);
                
                $('#glass').css('bottom',(hei)/2-110);
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
                window.location='puzzle';
            else if(cur_page==1)
                window.location=pre+'kids/color';
            else if(cur_page==2)
                window.location=pre+'kids/story';
            else if(cur_page==3)
                window.location=pre+'kids/learning';
            else if(cur_page==4)
                window.location=pre+'kids/cooking';
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
        $.fn.gotopage1=function(pag){
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
            $('#right_hand').css('transformOrigin', '0 120%').animate({rotate:1.57,opacity:0},0*durr*2,'easeInQuint'
                ,function(){  
                    $('#menu_bg2').css('background-color',arr1[pag]).stop().animate({opacity:1},0*durr*1.5,function(){
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
            $('#left_hand').css('transformOrigin', '100% 120%').animate({rotate:-1.57,opacity:0},0*durr*2,'easeInQuint'
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
         
        
        
        tmpp=new Array();
        lang=$('#lang').html();
        if(lang=='fa'){
            tmpp[0]= 'نام کاربری';    
            tmpp[1]= 'گذر واژه' ;
        }
        else{
            tmpp[0]= 'Username';    
            tmpp[1]= 'Password';    
        }
       
        $('#u_box2').val(tmpp[0]);
        $('#u_box2').focus(function(){if($('#u_box2').val()==tmpp[0]){$('#u_box2').val('');}});
        $('#u_box2').blur(function(){if($('#u_box2').val()==""){$('#u_box2').val(tmpp[0]);}});
     
    $('#p_box2').val(tmpp[1]);
    document.getElementById("p_box2").type="text";
    $('#p_box2').focus(function(){if($('#p_box2').val()==tmpp[1]){
            document.getElementById("p_box2").type="password";
            $('#p_box2').val('');}});
    $('#p_box2').blur(function(){if($('#p_box2').val()==""){
            document.getElementById("p_box2").type="text";
            $('#p_box2').val(tmpp[1]);}}); 
     
        
        
        
        
        
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
            
            window.location=('signup');
        });
        $('#kid').click(function(){
            if(conti==0){
                conti=1;
                $.fn.shortOut();
                movedown();
                $('#kid').removeClass('cursor');
                $('#minute').removeClass('coloo'); 
                $('#minute').css('color','#000');
            }
        });
        $('#continue').click(function(){
            conti=1;
            $.fn.shortOut();
            movedown();
            $('#kid').removeClass('cursor');
            $('#minute').css('color','#000');
            $('#minute').removeClass('coloo'); 
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
            $('#minute').html(m);
            $('#hour').html(h); 
            t=setTimeout(function(){startTime()},5000);
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
                $('#clock').addClass('coloo'); 
               
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
        $(window).scroll(function(){
            
        });
	$(window).keydown(function(e){
		  
		if(e.keyCode==49 )//1
		{

				//var cl = new CanvasLoader('bord');

		}
		else if(e.keyCode==81)//q
		{
                    
                    //clearInterval(sandTimer);
                    //alert('sad');
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
})

