MODULE MainModule
	CONST robtarget esteira1:=[[474.32,-40.36,1231.00],[0.222911,0.184267,0.956969,-0.0237814],[-1,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget esteira11:=[[879.24,157.75,1277.21],[0.635608,0.0125581,0.761452,0.126631],[0,-1,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget mov1:=[[474.31,300.61,1231.01],[0.222921,0.184246,0.956972,-0.0237729],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget mov11:=[[232.90,300.63,1230.99],[0.222921,0.184229,0.956975,-0.0237824],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget mov21:=[[423.12,160.14,1229.37],[0.195685,0.178528,0.964053,-0.020879],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget mov31:=[[15.94,-538.00,1405.45],[0.15586,0.881367,0.378347,-0.236121],[-1,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget mov41:=[[122.33,-498.02,1606.31],[0.863559,0.224805,0.277511,-0.355972],[-1,-1,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	TASK PERS wobjdata mesa:=[FALSE,TRUE,"",[[1352.56,-126.662,1234.19],[0.989528,-0.00175601,-0.0022972,0.14431]],[[0,0,0],[1,0,0,0]]];
	TASK PERS wobjdata mesa2:=[FALSE,TRUE,"",[[1197.29,412.682,1233.04],[0.79976,-0.0015868,-0.000765591,-0.600317]],[[0,0,0],[1,0,0,0]]];
	CONST robtarget p_home:=[[583.55,-252.91,1291.58],[0.0680966,0.885708,0.457078,0.0443257],[-1,-1,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget pRoX1:=[[201.28,328.12,163.98],[4.20989E-06,-0.101161,-0.99487,1.25289E-06],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget pRoX11:=[[192.57,316.89,1.12],[4.91149E-05,-0.101174,-0.994869,8.7877E-06],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget pInicial:=[[1644.61,-107.53,1149.68],[0.00787417,0.797387,0.603398,-0.00475342],[-1,-1,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget pInicial10:=[[192.56,316.89,1.10],[5.78358E-05,-0.101176,-0.994869,8.5355E-06],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget pRoX21:=[[-149.70,325.88,339.59],[0.403996,0.190313,0.894633,0.0141371],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	VAR signaldo signaldo1;
	VAR bool flag1:=FALSE;
	TASK PERS tooldata caneta1:=[TRUE,[[-19.0299,12.9732,151.98],[0.0912258,-0.700157,0.0928062,0.702029]],[0.5,[0,0,0],[1,0,0,0],0,0,0]];
	TASK PERS tooldata Atuador:=[TRUE,[[-24.5396,-27.9623,140.131],[1,0,0,0]],[1,[0,0,0],[1,0,0,0],0,0,0]];
	PROC main()
		teste1;
	ENDPROC
	PROC teste1()
		home;
		MoveJ pRoX1, v1000, z50, tool0\WObj:=mesa;
		MoveL pInicial, v50, fine, tool0\WObj:=mesa;
		MoveL Offs(pInicial,0,-100,0), v50, fine, tool0\WObj:=mesa;
		MoveL Offs(pInicial,140,-100,0), v50, z10, tool0\WObj:=mesa;
		MoveL Offs(pInicial,190,-50,0), v50, z0, tool0\WObj:=mesa;
		MoveL Offs(pInicial,140,0,0), v50, z50, tool0\WObj:=mesa;
		MoveL Offs(pInicial,0,0,0), v50, fine, tool0\WObj:=mesa;
		MoveJ pRoX1, v1000, z50, tool0\WObj:=mesa;
		porta;
		MoveJ pRoX1, v1000, z50, tool0\WObj:=mesa;
		home;
	ENDPROC
	PROC home()
		MoveJ p_home, v1000, z50, tool0;
	ENDPROC
	PROC porta()
		MoveJ pInicial, v30, fine, tool0;
		MoveL Offs(pInicial,80,-30,0), v30, fine, tool0\WObj:=mesa;
		MoveC Offs(pInicial,100,-50,0), Offs(pInicial,80,-70,0), v30, fine, tool0\WObj:=mesa;
	ENDPROC
	PROC rTesteFuncoes()
		MoveAbsJ [[6.02623,-23.8805,15.3767,-1.57368,19.5828,21.9452],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]]\NoEOffs, v1000, z50, tool0;
		MoveJDO [[862.04,89.75,1607.07],[0.619494,0.0999061,0.76553,0.142161],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v1000, z50, tool0, signaldo1, 1;
		IF flag1 = 0 THEN
			main;
		ENDIF
		TEST <EXP>
		CASE <EXP>:
			<SMT>
		ENDTEST
	ENDPROC
ENDMODULE