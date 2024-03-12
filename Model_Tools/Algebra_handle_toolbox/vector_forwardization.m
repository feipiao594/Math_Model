function forward_vec = vector_forwardization(vecType, dataVector, maxOrBestdata, minData)
    arguments
        vecType (1, :) PointerType 
        dataVector (1, :) {mustBeMatchMininumPositive(vecType, dataVector)}
        maxOrBestdata (1, 1) = PointerType.Error
        minData (1, 1) {mustBeMatchExtraData(vecType, maxOrBestdata, minData)} = PointerType.Error
    end
    forward_vec=0;
    switch(vecType)
        case PointerType.Maxinum
            forward_vec = dataVector;
        case PointerType.Mininum_nonpositive
            forward_vec = max(dataVector) - dataVector;
        case PointerType.Mininum_positive
            forward_vec = 1 / dataVector;
        case PointerType.Intervel
            m = max(minData-min(dataVector),max(dataVector)-maxOrBestdata);
            forward_vec = zeros(length(dataVector),1);
            disp(length(dataVector));
            for i=1:length(dataVector)
                if dataVector(i)<minData
                    forward_vec(i) = 1-(minData-dataVector(i)) / m;
                elseif dataVector(i)>maxOrBestdata
                    forward_vec(i) = 1-(dataVector(i)-maxOrBestdata) / m;
                else
                    forward_vec(i) = 1;
                end
            end
        case PointerType.Middle
            m = max(abs(dataVector-maxOrBestdata));
            forward_vec = 1 - abs(dataVector-maxOrBestdata) / m;  
    end
    
end

function mustBeMatchExtraData(vecType, maxOrBestdata, minData)
    switch(vecType)
        case PointerType.Middle
            if(maxOrBestdata == PointerType.Error)
                eidType = 'mustBeMatchExtraData:notDefMaxOrBestdata';
                msgType = 'Input vecType(PointerType.Mininum_positive) without BestData.';
                error(eidType,msgType)
            end
        case PointerType.Intervel
            if(maxOrBestdata == PointerType.Error)
                eidType = 'mustBeMatchExtraData:notDefMaxOrBestData';
                msgType = 'Input vecType(PointerType.Intervel) without MaxData.';
                error(eidType,msgType)
            elseif(minData == PointerType.Error)
                eidType = 'mustBeMatchExtraData:notDefMinData';
                msgType = 'Input vecType(PointerType.Middle) without MinData.';
                error(eidType,msgType)
            elseif(minData >= maxOrBestdata)
                eidType = 'mustBeMatchExtraData:notIsIntervel';
                msgType = 'Input vecType(PointerType.Middle), but minData is not less than maxData.';
                error(eidType,msgType)
            end
    end
end

function mustBeMatchMininumPositive(vecType, vec)
    if(vecType==PointerType.Mininum_positive && min(vec)<=0)
        eidType = 'mustBeMatchMininumPositive:notMatchMininumPositive';
        msgType = 'Input vecType(PointerType.Mininum_positive) cannot match with the dataVector.';
        error(eidType,msgType)
    end
end
