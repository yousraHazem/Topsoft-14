 var curr=0;
$(function(){
    
    var spinner = new Spinner();
    spinner.spin();
    $("#loginloader1").html( spinner.el );
    pre=$('#pre').html();
    ppage=$('#ppage').html(); 
    $('#menu_con').css('top',(hei-289)/2);
    $('#menu_center').css('left',(wid-313)/2);
    $('#menu_right').css('left',(wid)/2+15);
    $('#menu_left').css('right',(wid)/2+15);
         
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
    $('.item_box').each(function(index, element) {
            $(this).hover(function(){
                    $('.item_hover',this).stop().fadeTo(200,1);
            },function(){
                    $('.item_hover',this).stop().fadeTo(200,0);
            });
            $(this).click(function(){
                curr=index;
                gotopage(curr);
                if(ppage=='kids/story/index.html'){ 
                    window.location=pre+ppage+($(this).attr('idd'));
                }
                else if(ppage=='kids/cooking/index.html'){
                    window.location=pre+ppage+($(this).attr('idd'));
                }
                else{
                    window.location=pre+ppage+(curr+1);
                }
                
            });
    });
    $('#sitemap_btn').click(function(){
        $('#sitemap').animate({bottom:0},500,'easeOutExpo');
    });
    $('#sitemap').hover(function(){},function(){ 
        $('#sitemap').animate({bottom:-220},500,'easeOutExpo');
    });
    $('#menu_right').click(function(){
        gotopage(curr+1);
    });
    $('#menu_left').click(function(){
        
        gotopage(curr-1);
    });
    /*
    $('#home11,#home12').click(function(){
            
            window.location=(pre);
        });
    $('#register_btn').click(function(){
            
            window.location=(pre+'wizard');
        });*/
    function gotopage(page){
        
        if(page<0){
            page=curr=0;
        }
        if(page>$('.item_box').size()-1){
            page=curr=$('.item_box').size()-1;
        }
        curr=page; 
        $('#menu_bord').stop().animate({left:-(page*(313+55))},300,'easeOutQuad');   
    }
    $(window).mousewheel(function(e, delta) {

            if(delta>0)//up
            {
                gotopage(curr-1);
                e.preventDefault();
            }
            else//down
            {
                gotopage(curr+1);
                e.preventDefault();
            }

    }); 
    $(window).keydown(function(e){
		  
            if(e.keyCode==38|| e.keyCode==33|| e.keyCode==37)//up
            {
                gotopage(curr-1);
                //gonext();
                 
                if($('#contt').html()=='contt')
                    e.preventDefault();
            }
            else if(e.keyCode==40|| e.keyCode==34|| e.keyCode==39)//down
            { 
                gotopage(curr+1);
                //goprev();
                if($('#contt').html()=='contt')
                    e.preventDefault();
            } 
    });
     /*$('.menu_item').css('color','#888').filter('.menu_item:eq('+pg+')').css('color','#fff');
    $('#menu_roll').stop().animate({left:pg*150},0);
    
    var spinner2 = new Spinner();
    spinner2.spin();l
    $("#loginloader2").html( spinner2.el );
    var spinner3 = new Spinner();
    spinner3.spin();
    $("#qloader").html( spinner3.el );
    var spinner4 = new Spinner();
    spinner4.spin();
    $("#pageloader").html( spinner4.el );

   */ 
     
    $('#login_btn').click(function(){
       
        var str=(pre+"users\/ajaxLogin");
        
        $.ajax({beforeSend:function (XMLHttpRequest) {
                /*----start beforeSend-----*/
                $('#loginloader1').stop().animate({opacity:1},300);
                $('#error1').stop().animate({opacity:0},300);
                /*----end beforeSend-----var spinner = new Spinner().spin();*/
            },

            data:$("#loginformid").closest("form").serialize(),
            dataType:"html",
            success:function (data, textStatus) {
                    /*----start success-----*/
                    if(data=='0'){
                        $('#loginloader1').stop().animate({opacity:0},300);
                        $('#error1').stop().animate({opacity:1},300);
                    }
                    else{
                        location.reload();
                        $('#loginloader1').stop().animate({opacity:0},300);
                        $('#temp').html(data);
                        
                        
                        //$('#st1').hide();
                        //$('#st2').show();
                        $('#logged').html('1');
                    }
                    /*----end success-----*/

            },
            type:"post",
            url:str
        });
    });
    $('#logout_btn').click(function(){
        var str=(pre+"users\/ajaxLogout");

        $.ajax({beforeSend:function (XMLHttpRequest) {
                /*----start beforeSend-----*/
                $('#loginloader2').stop().animate({opacity:1},300);
                        
                /*----end beforeSend-----var spinner = new Spinner().spin();*/
            },

            data:$("#loginformid").closest("form").serialize(),
            dataType:"html",
            success:function (data, textStatus) {
                    /*----start success-----*/
                    $('#loginloader2').stop().animate({opacity:0},300);
                    
                    if(lang=='fa'){
                        $('#popup_btn').html('ورود');
                    }else{
                        $('#popup_btn').html('Menu');
                    }
                    
                    $('#st2').hide();
                    $('#st1').show();
                    $('#logged').html('0');
                    /*----end success-----*/
            },
            type:"post",
            url:str
        });
    });
    
     
    
     
    $('#mainBody, #menu').hover(function(){
        $('#login_box').stop().animate({top:-120},100,'easeInCirc',function(){
            $('#login_btn_box').stop().animate({top:0},100);
        });
    },function(){
        
    });
    $('#point').hover(function(){
        $('#point_detail').stop().fadeTo(300,1);
    },function(){
        $('#point_detail').stop().fadeTo(300,0);
    });
    $('#login_btn_box_a').hover(function(){
        
        $('#login_btn_box').stop().animate({top:-67},100,'easeInCirc',function(){
            $('#login_box').stop().animate({top:0},100);
        });
    },function(){
        
    });
   
   /*
   $('#u_box2').val('نام کاربری');
    $('#p_box2').val('گذرواژه');
    document.getElementById("p_box2").type="text";
     $('#u_box2').focus(function(){
        if($('#u_box2').val()=='نام کاربری'){
            $('#u_box2').val('');
        }
            
    });
    $('#u_box2').blur(function(){
        if($('#u_box2').val()==""){
            $('#u_box2').val('نام کاربری');
        }
    });
    $('#p_box2').focus(function(){
        if($('#p_box2').val()=='گذرواژه'){
            document.getElementById("p_box2").type="password";
            $('#p_box2').val('');
        }
    });
    $('#p_box2').blur(function(){
        if($('#p_box2').val()==""){
            document.getElementById("p_box2").type="text";
            $('#p_box2').val('گذرواژه');
        }
    });*/
    var tmpp=new Array();
    lang=$('#lang').html();
    if(lang=='fa'){
        tmpp[0]= 'نام کاربری';    
        tmpp[1]= 'گذر واژه' ;
    }
    else{
        tmpp[0]= 'Username';    
        tmpp[1]= 'Password';    
    }
    
/*   
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
    
    */
    $('#u_box').val(tmpp[0]);
        $('#u_box').focus(function(){if($('#u_box').val()==tmpp[0]){$('#u_box').val('');}});
        $('#u_box').blur(function(){if($('#u_box').val()==""){$('#u_box').val(tmpp[0]);}});
        
    $('#p_box').val(tmpp[1]);
    document.getElementById("p_box").type="text";
    $('#p_box').focus(function(){if($('#p_box').val()==tmpp[1]){
            document.getElementById("p_box").type="password";
            $('#p_box').val('');}});
    $('#p_box').blur(function(){if($('#p_box').val()==""){
            document.getElementById("p_box").type="text";
            $('#p_box').val(tmpp[1]);}}); 
    
    
    $(window).resize(function(){
            $.fn.initial();
    });
    /* 
     
    ///////////////////////////////////////////////////////
    $('#register_a').click(function(){
        $('#register').fadeOut(300);
    });
    $('#register_btn').click(function(){
        var a1=Math.floor(Math.random()*9)+1;
        var op1=Math.floor(Math.random()*2);
        if(op1==0)
            opp='+';
        else
            opp='x';
        var b1=Math.floor(Math.random()*9)+1;
        var str1=a1+' '+opp+' '+b1+' ?';
        $('#cap').html(str1);
        $('#register').fadeIn(300);
    });
    var a1=Math.floor(Math.random()*9)+1;
    var op1=Math.floor(Math.random()*2);
    if(op1==0)
        opp='+';
    else
        opp='x';
    var b1=Math.floor(Math.random()*9)+1;
    var str1=a1+' '+opp+' '+b1+' ?';
    $('#cap').html(str1);
    $('#c_box3').val($('#cap').html());
    $('#f_box3').val('نام');
    $('#l_box3').val('نام خانوادگی');
    $('#e_box3').val('ایمیل');
    $('#u_box3').val('نام کاربری');
    $('#p_box3').val('گذرواژه');
    //document.getElementById("p_box3").type="text";
    $('#p2_box3').val('تکرار گذرواژه');
    //document.getElementById("p2_box3").type="text";
    $('#f_box3').focus(function(){
        if($('#f_box3').val()=='نام'){
            $('#f_box3').val('');
        }      
    });
    $('#f_box3').blur(function(){
        if($('#f_box3').val()==""){
            $('#f_box3').val('نام');
        }
    });
    $('#c_box3').focus(function(){
        if($('#c_box3').val()==$('#cap').html()){
            $('#c_box3').val('');
        }      
    });
    $('#c_box3').blur(function(){
        if($('#c_box3').val()==""){
            $('#c_box3').val($('#cap').html());
        }
    });
    $('#l_box3').focus(function(){
        if($('#l_box3').val()=='نام خانوادگی'){
            $('#l_box3').val('');
        }      
    });
    $('#l_box3').blur(function(){
        if($('#l_box3').val()==""){
            $('#l_box3').val('نام خانوادگی');
        }
    });
    $('#e_box3').focus(function(){
        if($('#e_box3').val()=='ایمیل'){
            $('#e_box3').val('');
        }      
    });
    $('#e_box3').blur(function(){
        if($('#e_box3').val()==""){
            $('#e_box3').val('ایمیل');
        }
    });
    $('#u_box3').focus(function(){
        if($('#u_box3').val()=='نام کاربری'){
            $('#u_box3').val('');
        }      
    });
    $('#u_box3').blur(function(){
        if($('#u_box3').val()==""){
            $('#u_box3').val('نام کاربری');
        }
    });
    
    $('#p2_box3').focus(function(){
        if($('#p2_box3').val()=='تکرار گذرواژه'){
            document.getElementById("p2_box3").type="password";
            $('#p2_box3').val('');
        }
    });
    $('#p2_box3').blur(function(){
        if($('#p2_box3').val()==""){
            document.getElementById("p2_box3").type="text";
            $('#p2_box3').val('تکرار گذرواژه');
        }
    });
    $('#p_box3').focus(function(){
        if($('#p_box3').val()=='گذرواژه'){
            document.getElementById("p_box3").type="password";
            $('#p_box3').val('');
        }
    });
    $('#p_box3').blur(function(){
        if($('#p_box3').val()==""){
            document.getElementById("p_box3").type="text";
            $('#p_box3').val('گذرواژه');
        }
    });*/
    ////////////////////////////////////////////////
    $('#register_btn2').click(function(){
        var str=$('#cap').html();
        var ans=$('#c_box3').val();
        var a=parseInt(str[0]);
        var op=str[2];
        var b=parseInt(str[4]);
        if(op=='x'){
            ans2=a*b;
        }
        else if(op=='+'){
            ans2=a+b;
        }
        if(ans==ans2){
            //alert('yes');
        }
        else{
            //alert('no');
        }/*
        var a1=Math.floor(Math.random()*9)+1;
        var op1=Math.floor(Math.random()*2);
        if(op1==0)
            opp='+';
        else
            opp='x';
        var b1=Math.floor(Math.random()*9)+1;
        var str1=a1+' '+opp+' '+b1+' ?';
        alert(str1);*/
    });
    /////////////////////////////////////////
    $('.menu_item').each(function(index, element) {
       $(this).hover(function(){
           $('.menu_item').css('color','#888').filter('.menu_item:eq('+index+')').css('color','#fff');
           $('#menu_roll').stop().animate({left:index*150},300);
       },function(){
           $('.menu_item').css('color','#888').filter('.menu_item:eq('+pg+')').css('color','#fff');
           $('#menu_roll').stop().animate({left:pg*150},300);
       }); 
    });
        
})
 