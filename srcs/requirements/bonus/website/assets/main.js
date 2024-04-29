function slider(){
    'use strict';
    let cont=Array.from(document.querySelectorAll('.img-holder .box')),
        startSlide=1;
    let nextBtn=document.getElementById('next'),
          prevBtn=document.getElementById('prev'),
          ulList=document.createElement('ul');
          ulList.setAttribute('id','ulList');
          for(let i=1;i<=cont.length;i+=1){
              let elm=document.createElement('li');
              elm.append(i);
              elm.setAttribute('data-index',i);
              ulList.append(elm)
          }
        document.getElementById('indecator').append(ulList);
        let li=document.querySelectorAll('#ulList li');
        
        function check(){
            remover();
            cont[startSlide - 1].classList.add('activo');
            li[startSlide - 1].setAttribute('class','active');
            if(startSlide-1===0){
                prevBtn.classList.add('dis')
            }else{
                prevBtn.classList.remove('dis')
            };
             if(startSlide===cont.length){
                nextBtn.classList.add('dis');
            }else{nextBtn.classList.remove('dis')};
        }
        function remover(){
            cont.forEach(item=>{
                item.classList.remove('activo')
            });
            li.forEach(elm=>{
                elm.classList.remove('active')
            })

        };
        
    function manuSlid(){
        remover();
        li.forEach(function(e){
            e.onclick=function(){
                remover();
                startSlide=parseInt(e.getAttribute('data-index'));
                e.classList.add('active');
                cont[startSlide-1].classList.add('activo');
                if(startSlide===1){
                    prevBtn.classList.add('dis')
                }else if(startSlide===cont.length){
                    nextBtn.classList.add('dis');
                }else{
                    prevBtn.classList.remove('dis');
                    nextBtn.classList.remove('dis');
            }
            }
        })
    }
    nextBtn.onclick=function(e){
        if(this.classList.contains('dis')){
            e.preventDefault()
        }else{
            startSlide+=1;
            check()
        }
        
        
    };
    prevBtn.onclick=function(e){
        
       if(this.classList.contains('dis')){
           e.preventDefault()
       }else{
           startSlide-=1;
           check()
       }
    };
    manuSlid();
    check();
 };
   
slider()
function skill(){
    const progArr=[90,75,80,65];
    let progBars=Array.from(document.querySelectorAll('.prog-holder span'));
    let section=document.getElementById('sec-ski');
    
    progBars.forEach(item=>{
        item.setAttribute(`style`,`width:${0}%`);
        item.setAttribute('data-progress',`${0}%`);
    });
   /* section.onclick=function(){
       for(let i=0;i<progBars.length;i+=1){
       let j=1;
       while(j<=progArr[i]){
        progBars[i].setAttribute(`style`,`width:${j}%`);
        progBars[i].setAttribute('data-progress',`${j}%`);
        j+=1;
       }*/
        /*for(let j=1;j<=progArr[i];j+=1){
            
                setTimeout(() => {
                    progBars[i].setAttribute(`style`,`width:${j}%`) 
                    progBars[i].setAttribute('data-progress',`${j}%`)
                },i*250);
            
        }
       }
    }*/
section.onclick=function(){
    for(let i=0;i<progBars.length;i+=1){
        check(progBars[i],progArr[i],i);
    }
}
function check(bar,pro,ind){
     let progress=0;
     let interv=setInterval(() => {
        
           
            bar.setAttribute('style',`width:${progress}%`);
            bar.setAttribute('data-progress',`${progress}%`);
            progress+=5;
            
           if(progress>pro){
               clearInterval(interv);
           }
           
         
     },ind*20);
    
}

}
skill()
  