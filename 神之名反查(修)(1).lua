--by.神之名
--这两天搓的，可能会有bug
function getPointer(Address,Flags)
	return gg.getValues({
		{
			address=Address,
			flags=Flags
		}
	})[1].value
end


function va(add,fla)
return gg.getValues({{address=add,flags=fla}})[1].value
end

local function getName(addr)
    local str = ""
    local t = {}
    for i=1, 128 do
        t[i] = {address=addr+(i-1), flags=gg.TYPE_BYTE}
    end
    t = gg.getValues(t)
    
    for i, v in ipairs(t) do
        if v.value==0 then break end
        if v.value<0 then return "" end
        str = str..string.char(v.value&0xFF)
    end
    return str
end


function aycXa(lib)
    ranges = {}
    for i, v in pairs(gg.getRangesList(lib)) do
        modjs = v.type:sub(2, 3)
        if modjs == '-x' then
            table.insert(ranges, v)
        end
    end
    return ranges[1].start
end

local xa=aycXa("libil2cpp.so")



function dll(a1)--dll名
local Add=a1
    local a11 = getPointer(Add, 32)
    local a2 = getPointer(a11,32)
    local name = getName(a2)
    return name
    
end

function xsf(a1)--修饰符


    local ad = getPointer(a1, 32) + 0x68
    local ad2 = getPointer(ad, 32) + 0x1C
    local ad3=gg.getValues({{address=ad2,flags=4,}})[1].value
    
         local fff=ad3 & 7
    if fff == 1 or fff == 2 then
        return "public"
    elseif fff == 5 or fff == 6 or fff == 0 then
        return "internal"
    elseif fff == 3 then
        return "private"
    elseif fff == 4 then
        return "protected"
    elseif fff == 7 then
        return "protected internal"
    else
        return ""  
end end


function flxsf(a1)--修饰符

    local a2=getPointer(a1,32) + 58
    local a3=getPointer(a2,32)
    local ad = a3 + 0x68
    local ad2 = getPointer(ad, 32) + 0x1C
    local ad3=gg.getValues({{address=ad2,flags=4,}})[1].value
    
         local fff=ad3 & 7
    if fff == 1 or fff == 2 then
        return "public"
    elseif fff == 5 or fff == 6 or fff == 0 then
        return "internal"
    elseif fff == 3 then
        return "private"
    elseif fff == 4 then
        return "protected"
    elseif fff == 7 then
        return "protected internal"
    else
        return ""  
end end



function fflx(n1)--方法类型

    local Add = n1 + 0x20
    local ad = getPointer(Add, 32)
    local add = gg.getValues({{address = ad + 0xA, flags = 1}})[1].value
    
    local type = {
        [1] = "void",
        [2] = "bool",
        [3] = "char",
        [4] = "sbyte",
        [5] = "byte",
        [6] = "short",
        [7] = "ushort",
        [8] = "int",
        [9] = "uint",
        [10] = "long",
        [11] = "ulong",
        [12] = "float",
        [13] = "double",
        [14] = "string",
        [22] = "TypedReference",
        [24] = "IntPtr",
        [25] = "UIntPtr",
        [28] = "object"
    }
    return type[add] or "没匹配"
end


function zdlx(Add1)
   local a=Add1 + 0x8
    local ad = getPointer(a, 32)
    local add = gg.getValues({{address = ad + 0xA, flags = 1}})[1].value
    
    local type = {
        [1] = "void",
        [2] = "bool",
        [3] = "char",
        [4] = "sbyte",
        [5] = "byte",
        [6] = "short",
        [7] = "ushort",
        [8] = "int",
        [9] = "uint",
        [10] = "long",
        [11] = "ulong",
        [12] = "float",
        [13] = "double",
        [14] = "string",
        [22] = "TypedReference",
        [24] = "IntPtr",
        [25] = "UIntPtr",
        [28] = "object"
    }
    return type[add] or "没匹配"
end


function ffxsf(n1)--修饰符

local Add=n1 +0x30
    local ad = getPointer(Add, 32) + 0x18
    local ad2=gg.getValues({{address=ad,flags=4,}})[1].value
    
         local fff=ad2 & 7
    if fff == 6 then
        return "public"
    elseif fff == 2 or fff == 3 then
        return "internal"
    elseif fff == 1 then
        return "private"
    elseif fff == 4 then
        return "protected"
    elseif fff == 5 then
        return "protected internal"
    else
        return ""  
end end



local tt = gg.getResults(10000)
if #tt == 0 then
gg.alert("把反查的值加载到搜索列表")
else
local A=gg.prompt({"输入反查偏移","保存字段","保存方法","保存实例","保存属性","是否Dump","是否Dump父类","子类到字段偏移"},{"5000",false,false,false,false,false},{"text","checkbox","checkbox","checkbox","checkbox","checkbox","checkbox","checkbox"})
local start=tt[1].address
local ff,add,zd,addzd,sbb,lmm,sx,Dump,Dumpzd,Dumpff,Dumpfl,Dumpflff,Dumpflzd,A8={},{},{},{},{},{},{},{},{},{},{},{},{},{}
local hss=""

if A==nil or A[1]=="" then
gg.alert("未输入反查偏移")
os.exit()
end

    local cur = start
 local sm=A[1] / 4

    for i=1,sm do
    
        cur = cur - 0x4
        if cur ~= 0 then
        local a1=getPointer(cur,32)
        local f0=a1 + 0x58
        local f1=getPointer(f0,32)
        if a1~=0 then
        local yy=start - cur
        local py=string.format("%X",yy)
        local a2=a1 + 0x10
        local fa2=f1 + 0x10
        local a3=a1 + 0x18
        local fa3=f1 + 0x18
        local a4=a1 + 0x20
        local a5=a1 - 0x4    
        local b1=a1 + 0x58  
        local fb21=f1 + 0x58
        local b3=a1 + 0x98     
        
        local fb1=f1 + 0x98
        local fb2=f1 + 0x80
        
        local z1=a1 + 0x80  
        local a6=getPointer(a2,32)
        local a7=getPointer(a3,32)
        local fa7=getPointer(fa3,32)
        local a8=getPointer(b1,32) + 0x10
        local fa8=getPointer(fb21,32) + 0x10
        local fa6=getPointer(fa2,32)
        local a9=getPointer(a8,32)
        local fa9=getPointer(fa8,32)
        local c1=getPointer(b3,32)
        local c2=getPointer(z1,32)
        
        local fc1=getPointer(fb1,32)
        local fc2=getPointer(fb2,32)
        
        local c3=getPointer(z1,32)
        local fc3=getPointer(z1,32) - 0x8
        local v1=va(a2,4)
        local v2=va(a3,4)
        local v3=va(a4,4)
        local v4=va(a5,4)

        local kkluv=getName(a6)
        local Athree=getName(a7)
              
        if A[8] then
        table.insert(A8,{address=cur,flags=4,name="类名:"..kkluv})
        table.insert(lmm,{address=start,flags=4,name=kkluv.." + 0x"..py})
        end
        
        if A[7] then
        for l=1,1000 do
        local Fdd = fc1 + (l -1) * 0x8
        local fn0=getPointer(Fdd,32)
        local fsl=getPointer(fn0,32)
        local fn1=getPointer(Fdd,32) 
        local fn33=fn1+ 0x10
        local fn2=getPointer(fn33,32)
        local fffm=getName(fn2)
        if fffm=="" then
        break
        end    
        local flof=fsl - xa
        local floff=string.format("%X",flof)         
        table.insert(Dumpflff,"	// RVA: 0x"..floff.." Offset: 0x"..floff.." VA: 0x"..floff.."\n   "..ffxsf(fn1).." "..fflx(fn1).." "..fffm.."() { }")
        end
        end
        
        if A[4] then
        table.insert(lmm,{address=cur,flags=4,name="类名:"..kkluv})
        end
        for i=1,1000 do--方法
        local Add = c1 + (i - 1) * 0x8
        local n0=getPointer(Add,32)
        local sl=getPointer(n0,32)
        local n1=getPointer(Add,32) 
        local n33=n1+ 0x10
        local n2=getPointer(n33,32)
        local ffm=getName(n2)
        
        if ffm=="" then
        break
        end             
        local of=sl - xa
        local off=string.format("%X",of)
        if ffm~="" and #off < 8 then
        table.insert(ff,"方法:"..fflx(n1).." "..ffm.."\n偏移:0x"..off)
        if A[6] then
        table.insert(Dumpff,"	// RVA: 0x"..off.." Offset: 0x"..off.." VA: 0x"..off.."\n   "..ffxsf(n1).." "..fflx(n1).." "..ffm.."() { }")
        end
        if A[3] then
        table.insert(add,{address=sl,flags=4,name=fflx(n1).." "..ffm})
        end
 
        if A[5] then
        local sx1=string.find(ffm,"get")
        local sx2=string.find(ffm,"set")
        if sx1 or sx2 then
        table.insert(sx,{address=sl,flags=4,name=fflx(n1).." "..ffm})
        end end
 end  
 end
  
  
        if A[7] then
        for p=1,2000 do
        local Fdd1=fc2+(p-1)*0x20
        local FBdd=fc3+(p-1)*0x20
        local fjh=va(FBdd,4)
        local fstr=string.format("%X",fjh)
        local fnum=tonumber(fstr,16)        
        local fk1=getPointer(Fdd1,32)
        local fzdm=getName(fk1)        
        if fzdm=="" then
        break
        end
        if #fzdm >2 and #fstr < 5 then
        table.insert(Dumpflzd," "..zdlx(Fdd1).." "..fzdm.."; // 0x"..fstr)
        end
        end
        end
        
        
        
        for n=1,10000 do--字段
        local Add1=c2+(n-1)*0x20   
        local Bdd0=c3+0x18
        local Bdd=Bdd0+(n-1)*0x20
        local jh=va(Bdd,4)
        local str=string.format("%X",jh)
        local num=tonumber(str,16)
        
        local k1=getPointer(Add1,32)
        local zdm=getName(k1)
        if zdm=="" then
        break
        end

   

        if #zdm >2 and #str < 5 then
        local adds=cur + num
        local ass=cur + num
        if A[6] then
        table.insert(Dumpzd,"   "..zdlx(Add1).." "..zdm.."; // 0x"..str)   
        end

        
        table.insert(zd,"字段:"..zdm.."\n偏移:0x"..str)   
       
        if A[2] then
        local sub=adds - cur
        local bv=string.format("%X",sub)
    if num==sub then
        table.insert(addzd,{address=adds,flags=4,name=zdm.." // 0x"..str})
        end end  
        end end
        
        
        local lm=getName(a6)
        local lmkj=getName(a7)
        local fl=getName(a9)
        
        local flm=getName(fa6)
        local flmkj=getName(fa7)
        local flfl=getName(fa9)
        if A[6] then
        local file=io.open("Dump.cs","w+")
        table.insert(Dump,"// DLL: "..dll(a1).."\n// Namespace: "..lmkj.."\n".."// ClassAdd: 0x"..string.format("%X",cur).."\n"..xsf(a1).." class "..lm.." : "..fl.."\n{\n\n// Fields\n"..table.concat(Dumpzd,"\n").."\n\n// Method\n"..table.concat(Dumpff,"\n\n").."\n\n}")
        file:write(table.concat(Dump)):close()
        end
        
        if A[7] then
        local file=io.open("Dump父类.cs","w+")
        table.insert(Dumpfl,"// DLL: "..dll(f1).."\n// Namespace: "..flmkj.."\n".."// ClassAdd: 0x"..string.format("%X",cur).."\n"..xsf(f1).." class "..flm.." : "..flfl.."\n{\n\n// Fields\n"..table.concat(Dumpflzd,"\n").."\n\n// Method\n"..table.concat(Dumpflff,"\n\n").."\n\n}")
        file:write(table.concat(Dumpfl)):close()
        end
                
        if v1~=0 and v2~=0 and v3~=0 and lm~="" then
        gg.addListItems(add)
        gg.addListItems(addzd)  
        gg.addListItems(sx)    
        gg.addListItems(lmm)
        gg.addListItems(A8)
  print("DLL:"..dll(a1).."\n空间:"..lmkj.."\n类名:"..xsf(a1).." "..lm.."\n父类:"..fl.."\n实例地址:0x"..string.format("%X",cur).."\n字段偏移:0x"..py.."\n\n字段〖\n"..table.concat(zd,"\n\n").."\n〗\n\n方法【\n"..table.concat(ff,"\n\n").."\n】")
        break
        end
        end
        end

        if (cur - start) > 10000 * 4 then
        break 
       end
    end
    return start
end
