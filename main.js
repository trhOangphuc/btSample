function Random(){
    let numbers =[];
    for(let i=0; i<3 ;i++){
        numbers.push(Math.floor(Math.random()*1000));
    }
    return numbers;
}
function Xuat(numbers){
    document.getElementById('txt1').value= numbers[0];
    document.getElementById('txt2').value= numbers[1];
    document.getElementById('txt3').value= numbers[2];
}
function Max(numbers){
    let Max = numbers[0];
    for(let i=0; i< numbers.length; i++){
        if(numbers[i] > Max){
            Max = numbers[i];
        }
    }
    return Max;
}
function Min(numbers){
    let Min = numbers[0];
    for(let i=0; i< numbers.length; i++){
        if(numbers[i] < Min){
            Min = numbers[i];
        }
    }
    return Min;
}
function Sum(numbers){
    let sum = 0;
    for(let i=0; i< numbers.length; i++){
        sum += numbers[i];
    }
    return sum;
}

document.getElementById('btnRandom').addEventListener('click', function(){
    let numbers = Random();
    Xuat(numbers);
});

document.getElementById('btnReset').addEventListener('click', function(){
    document.getElementById('txt1').value= '';
    document.getElementById('txt2').value= '';
    document.getElementById('txt3').value= '';
    document.getElementById('max').value= '';
    document.getElementById('min').value= '';
    document.getElementById('sum').value= '';
});

document.getElementById('btnRun').addEventListener('click', function(){
    let numbers= [];
    for(let i=0; i<3; i++){
        let doiGT= parseFloat(document.getElementById(`txt${i+1}`).value);
        if(isNaN(doiGT)){
            alert('Vui lòng nhập đúng kiểu dữ liệu vào textBox !');
            document.getElementById(`txt${i+1}`).focus();
            return;
        }
        numbers.push(doiGT);
    }

    let maxN = Max(numbers);
    let minN = Min(numbers);
    let sumN = Sum(numbers);

    document.getElementById('max').value= maxN;
    document.getElementById('min').value= minN;
    document.getElementById('sum').value= sumN;
});