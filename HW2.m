tran_num = 10;
item_num = 5;
rand_list = 2;
tran = zeros(tran_num,item_num);
min_sup = 2;
for i=1:tran_num
    list_num = randi(rand_list,1,1);
    list_item = randperm(item_num,list_num);
    tran(i,list_item) = 1;
    
end

disp(tran);

list = 1:item_num;

for i=1:4
    new_list = [];
    c = combnk(list,i);
    index = 1;
    sumAns = [];
    labels = [];
    for j = 1:size(c,1)
        tempMatrix = ones(tran_num,1);
        name = '';
        for k=c(j,:)
            tempMatrix = times(tempMatrix,tran(:,k));
            name = strcat( name,':', num2str(k)); 
        end
        sumProduct = sum(tempMatrix);
        if sumProduct > min_sup
            new_list = unique([new_list,c(j)]);
            labels{1,index} = mat2str(c(j,:));
            sumAns(index) = sumProduct;
            index = index+1;
        end
        
    end 
    disp(labels);
    disp(sumAns);
    list = unique(new_list);
    if size(list,1) == 0
        break
    end
    
end


