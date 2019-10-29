MODULE MainModule
    !***********************************************************
    !
    ! Module:  Modulo principal OP 30
    !
    ! Description:
    !   Robo para manipulacao do cubo de rodas, op 30
    !   Maquinas: HAAS 1 e HASS 2
    !   Robo: ABB 4600
    ! Author: Samuel
    ! Atualizacao: Fabio
    ! Data ultima atualizaacao: 12/04/2019
    ! Version: 1.1
    !
    !***********************************************************
    !***********************************************************
    !	Dados de ferramenta
    !***********************************************************
	PERS tooldata SOPRADOR:=[TRUE,[[169.147,-4.07544,233.187],[1,0,0,0]],[8.8,[1,1,1],[1,0,0,0],0,0,0]];
	PERS tooldata GARRA_1:=[TRUE,[[143.901,-87.4752,215.097],[1,0,0,0]],[8.8,[1,1,1],[1,0,0,0],0,0,0]];
	PERS tooldata GARRA_2:=[TRUE,[[143.911,87.0173,214.889],[1,0,0,0]],[8.8,[1,1,1],[1,0,0,0],0,0,0]];
	!***********************************************************
    !	Dados de WorkObject
    !***********************************************************
	PERS wobjdata mesa:=[FALSE,TRUE,"",[[1352.56,-126.662,1234.19],[0.989528,-0.00175601,-0.0022972,0.14431]],[[0,0,0],[1,0,0,0]]];
	PERS wobjdata WHAAS_2:=[FALSE,TRUE,"",[[134.403,-1765.78,933.332],[0.495143,0.507191,-0.501526,-0.496046]],[[0,0,0],[1,0,0,0]]];
	PERS wobjdata ESTEIRA_SAIDA:=[FALSE,TRUE,"",[[582.324,-710.829,1044.06],[0.00253086,0.0116489,0.0144848,-0.999824]],[[0,0,0],[1,0,0,0]]];
	PERS wobjdata ESTEIRA_ENTRADA:=[FALSE,TRUE,"",[[-1248.51,-676.73,833.373],[0.0248931,-0.033471,-0.0415233,-0.998266]],[[0,0,0],[1,0,0,0]]];
	PERS wobjdata WHAAS_1:=[FALSE,TRUE,"",[[-351.335,1663.61,973.567],[0.502387,0.490287,0.517761,0.48903]],[[0,0,0],[1,0,0,0]]];
	PERS wobjdata INSP:=[FALSE,TRUE,"",[[1298.01,305.58,1166.13],[0.707005,0.014347,-0.00586376,-0.707039]],[[0,0,0],[1,0,0,0]]];	
	!***********************************************************
    !	Dados de RobTarget
    !***********************************************************
	CONST robtarget p600:=[[526.48,-863.96,1023.84],[0.335918,0.131635,0.932011,0.0344394],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget p601:=[[526.47,-863.92,1116.81],[0.335898,0.13164,0.932017,0.0344712],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget p602:=[[526.47,-478.94,1116.85],[0.335912,0.13164,0.932012,0.034451],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget p604:=[[488.28,-125.15,1116.92],[0.335946,0.131662,0.931998,0.0344166],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget p603:=[[488.28,-125.15,1116.92],[0.335946,0.131662,0.931998,0.0344152],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget p_home:=[[583.55,-252.91,1291.58],[0.0680966,0.885708,0.457078,0.0443257],[-1,-1,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget pRoX1:=[[201.28,328.12,163.98],[4.20989E-06,-0.101161,-0.99487,1.25289E-06],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget pRoX11:=[[454.33,-170.80,1262.06],[0.334797,0.140185,0.926424,-0.0999882],[-1,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget pRoX21:=[[-149.70,325.88,339.59],[0.403996,0.190313,0.894633,0.0141371],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget p1:=[[716.06,-114.98,1120.56],[0.4131,0.0342706,0.909953,-0.0126275],[-1,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget p001:=[[85.35,41.05,-63.65],[0.370862,-0.247441,0.893407,0.0553047],[-2,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget Ponto_INIC:=[[637.56,-126.74,1512.73],[0.324282,0.167897,0.928771,-0.0635289],[-1,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget P002:=[[89.69,46.17,-1.18],[0.370878,-0.247441,0.893399,0.0553135],[-2,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget P003:=[[89.69,46.18,-1.18],[0.370878,-0.247442,0.893399,0.0553139],[-2,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget P004:=[[-229.58,33.74,78.74],[0.358027,-0.216951,0.904958,0.0761568],[-2,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget P14:=[[-229.60,33.72,78.68],[0.358003,-0.216951,0.904968,0.0761468],[-2,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget P005:=[[-496.20,-155.23,238.16],[0.453584,-0.195906,0.861454,0.117384],[-2,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget P15:=[[-1090.44,190.44,174.92],[0.337571,-0.51464,0.72267,0.314548],[-2,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget P006:=[[-884.17,-32.40,428.90],[0.267895,-0.489309,0.812135,0.171014],[-2,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget P16:=[[-1909.74,-381.48,-129.92],[0.0273025,-0.914766,0.206316,0.346252],[-1,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget P007:=[[-1860.53,-323.46,580.03],[0.0273074,-0.914767,0.206315,0.34625],[-1,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget P008:=[[-802.94,103.57,101.73],[0.359991,-0.395245,0.819815,0.205163],[-2,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget P08:=[[-802.94,103.58,101.73],[0.359991,-0.395245,0.819814,0.205165],[-2,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget P009:=[[-1821.67,-109.43,92.32],[0.111244,-0.807999,0.371399,0.44365],[-1,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget P200:=[[-42.42,49.15,-40.96],[0.385307,0.00923643,0.922671,-0.0114885],[-2,1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget P250:=[[-57.46,76.84,56.33],[0.411502,0.500958,0.7555,0.0944799],[-2,1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget P251:=[[-61.41,119.89,31.14],[0.582506,0.0638607,0.798074,-0.14031],[-2,1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget P261:=[[-61.87,142.67,120.70],[0.582489,0.063863,0.798081,-0.140334],[-2,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget P252:=[[-81.55,40.35,50.86],[0.293074,0.0113683,0.945878,-0.138902],[-2,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget P253:=[[-51.46,32.33,47.14],[0.587624,-0.0349624,0.797047,-0.134875],[-2,1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget P254:=[[-31.43,42.50,26.98],[0.167972,-0.979848,0.094838,0.0518499],[-2,1,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget P255:=[[-80.17,42.22,26.72],[0.053429,0.982489,-0.0908,-0.153674],[-2,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget P256:=[[-115.28,14.90,-8.33],[0.631227,0.27124,0.726357,0.0196716],[-2,1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget P257:=[[-146.19,101.43,88.09],[0.613937,0.0337518,0.767654,-0.180692],[-2,1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget P258:=[[-8.89,-9.53,13.41],[0.334554,0.0908026,0.937137,-0.0400408],[-2,1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget P259:=[[-109.66,-4.18,20.30],[0.543637,0.444393,0.707965,0.0758868],[-2,1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget P201:=[[-42.69,49.66,-9.38],[0.385325,0.00925301,0.922663,-0.0114922],[-2,1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget P202:=[[-42.76,49.82,0.85],[0.385332,0.00927438,0.92266,-0.011497],[-2,1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget P203:=[[-41.27,49.00,-45.83],[0.385333,0.00945211,0.922657,-0.0115462],[-2,1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget P204:=[[-41.33,49.63,-10.79],[0.38533,0.00944078,0.922658,-0.0115502],[-2,1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget P205:=[[-41.59,50.39,39.93],[0.385335,0.00949168,0.922655,-0.011574],[-2,1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget P206:=[[-206.70,49.22,39.15],[0.38534,0.00952527,0.922653,-0.0115806],[-2,1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget P207:=[[-255.99,47.03,-64.77],[0.38534,0.00958757,0.922652,-0.0115687],[-2,1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget P208:=[[-277.82,-75.39,-14.00],[0.363612,-0.0295289,0.912679,-0.184204],[-2,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget P209:=[[-277.82,-75.39,-14.00],[0.36361,-0.0295297,0.91268,-0.184205],[-2,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget P210:=[[-300.22,-87.75,93.08],[0.260087,-0.148276,0.877248,-0.37524],[-2,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget P211:=[[-367.30,-85.08,252.03],[0.119157,-0.238187,0.753833,-0.60067],[-2,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget P212:=[[-880.62,151.05,281.18],[0.318844,-0.149285,0.621407,-0.699933],[-2,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget P213:=[[-1078.76,315.81,108.55],[0.318878,-0.149368,0.621407,-0.6999],[-2,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget P020:=[[-213.86,-465.28,-2.62],[0.0793122,-0.859809,0.232302,0.447743],[-1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget P30:=[[-211.43,191.56,114.98],[0.404739,-0.040619,0.91352,0.00422168],[-1,-1,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget P021:=[[-118.39,-92.23,128.21],[0.179945,-0.780812,0.396566,0.447982],[-1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget P022:=[[-124.55,-93.84,77.18],[0.299156,-0.200124,0.926504,0.109756],[-1,-1,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget P023:=[[-222.20,197.68,41.17],[0.398907,-0.139976,0.905095,0.0456403],[-1,-1,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget P024:=[[-220.43,199.91,-35.84],[0.398888,-0.139981,0.905102,0.0456583],[-1,-1,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget P300:=[[-117.49,58.78,-34.45],[0.557325,-0.0987539,0.770344,-0.293611],[1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget P301:=[[50.27,87.46,-55.35],[0.280888,-0.193004,0.864745,-0.368874],[1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget P302:=[[-20.21,3.82,-13.76],[0.480469,-0.0961551,0.844562,-0.215913],[1,1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget P303:=[[17.48,-75.67,-52.66],[0.439122,0.304471,0.845216,-0.00890038],[1,1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget P100:=[[-4.40,9.59,-93.17],[0.400979,0.0863809,0.911145,-0.0396045],[1,1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget P101:=[[-4.55,9.41,-86.16],[0.400881,0.0864491,0.91118,-0.0396496],[1,1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget P102:=[[-74.96,-25.45,-20.74],[0.334534,0.603806,0.684647,-0.234017],[1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget P150:=[[-10.07,9.79,-90.41],[0.304913,0.534166,0.754219,-0.229886],[1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget P151:=[[-10.08,9.63,-32.92],[0.304918,0.534228,0.754172,-0.229892],[1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget P152:=[[49.82,9.66,-32.91],[0.304923,0.534224,0.754173,-0.229892],[1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget P153:=[[-116.21,131.04,131.77],[0.287309,-0.344443,0.645014,-0.618684],[1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget P154:=[[-825.56,102.07,122.03],[0.287357,-0.344468,0.644991,-0.618671],[1,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget P155:=[[-822.99,-134.87,184.01],[0.182795,-0.29685,0.646068,-0.679016],[1,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget P400:=[[50.48,74.02,-31.90],[0.266353,0.392315,0.832358,-0.286924],[1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget P401:=[[16.18,68.55,-50.90],[0.24433,0.474208,0.808172,-0.249574],[1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget P402:=[[122.21,51.31,-24.79],[0.400111,0.576566,0.659671,-0.26892],[1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget P403:=[[-35.66,-38.34,25.75],[0.17672,0.969702,0.0595555,-0.157799],[0,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget P404:=[[18.97,-65.88,20.78],[0.176721,0.969702,0.0595771,-0.157791],[0,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget P405:=[[-16.89,109.64,26.24],[0.430321,0.223584,0.871678,0.0707853],[1,1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget P406:=[[-8.42,92.31,-22.97],[0.438347,-0.171192,0.868566,-0.155364],[1,1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget P407:=[[-76.55,87.01,-58.39],[0.430262,-0.133586,0.879118,-0.155501],[1,1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget P408:=[[90.53,12.09,71.02],[0.53152,0.506758,0.568416,-0.370926],[1,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget P418:=[[-14.99,2.06,11.85],[0.36118,-0.0351557,0.928747,-0.0757818],[0,1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget P428:=[[-183.14,-214.40,245.78],[0.0422976,-0.248619,0.71346,-0.653739],[1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget P25:=[[38.95,76.65,72.30],[0.398813,-0.135604,0.905683,0.0479332],[-1,-1,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget P025:=[[38.95,76.65,72.30],[0.398813,-0.135606,0.905683,0.0479339],[-1,-1,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget P026:=[[39.94,77.91,28.70],[0.398797,-0.13563,0.905687,0.0479122],[-1,-1,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget P027:=[[-170.12,196.52,36.56],[0.398837,-0.135632,0.905671,0.0478738],[-1,-1,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget P500:=[[-241.71,25.05,66.93],[0.262685,-0.677174,0.626837,0.28197],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget P501:=[[-243.18,28.52,189.46],[0.262682,-0.677191,0.626823,0.281964],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget P502:=[[-243.14,28.45,186.82],[0.262687,-0.677167,0.626834,0.281992],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget P503:=[[-241.57,-421.95,201.89],[0.26709,-0.675184,0.624942,0.28677],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget P504:=[[-241.57,-421.95,201.89],[0.267092,-0.675185,0.624941,0.286767],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	!***********************************************************
    !	Dados Signal
    !***********************************************************
	VAR signaldo signaldo1;
	!***********************************************************
    !	Dados Booleanos
    !***********************************************************
	VAR bool flag1:=FALSE;
	!***********************************************************
    !	Dados de JointTarget
    !***********************************************************
	CONST jointtarget jpos10:=[[0,0,0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	!***********************************************************
    !	Dados numericos
    !***********************************************************
	PERS num nTempoCastanha1 := 0.7;
	PERS num nTempoCastanha2 := 0.7;
    VAR clock clkTempoCiclo;
	VAR num nTempoCiclo:=0;
    CONST robtarget P26:=[[-520.16,-386.35,1120.15],[0.159388,0.927209,0.231646,-0.247426],[-2,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pProxEsteiraEntrada:=[[-990.27,-595.73,1140.58],[0.0824405,0.901392,0.205264,-0.37224],[-2,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pProxEsteiraEntrada10:=[[-310.42,-633.70,1198.10],[0.198941,0.774797,0.51558,-0.307067],[-2,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget P17:=[[-884.16,-32.40,428.91],[0.267893,-0.489313,0.812134,0.171011],[-2,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget P513:=[[-241.07,227.00,234.05],[0.258326,-0.678267,0.625611,0.286062],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget P523:=[[-238.85,221.69,47.97],[0.258317,-0.678267,0.625618,0.286055],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget P533:=[[-238.95,221.59,42.41],[0.258151,-0.677905,0.626011,0.286206],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget P543:=[[-240.67,226.02,199.58],[0.258315,-0.678269,0.625618,0.286053],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget P511:=[[-240.05,25.05,65.87],[0.267101,-0.675142,0.624963,0.286813],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget P553:=[[-239.07,166.15,242.95],[0.257069,-0.680397,0.625228,0.282957],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget P563:=[[-236.68,160.49,43.97],[0.257064,-0.680397,0.625239,0.282939],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget P573:=[[-236.65,160.42,41.58],[0.257096,-0.680376,0.625228,0.282983],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget P583:=[[-238.93,165.88,232.80],[0.257102,-0.680371,0.625222,0.283005],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget P521:=[[-237.80,24.36,63.01],[0.257385,-0.680365,0.625158,0.282902],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    PERS tooldata toolSopradorComXZ:=[TRUE,[[133.077,1.63825,206.684],[0.920765,0.0288774,0.374874,0.104054]],[5,[1,0,150],[1,0,0,0],0,0,0]];
    CONST robtarget P512:=[[-241.05,27.42,150.59],[0.267086,-0.675169,0.624952,0.286788],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget P410:=[[16.16,73.56,-50.88],[0.244322,0.474231,0.808158,-0.249584],[1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget P420:=[[16.17,92.71,-50.87],[0.24433,0.474222,0.808162,-0.249579],[1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget P411:=[[117.96,68.48,-50.94],[0.318298,0.539643,0.734006,-0.262119],[1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget P421:=[[117.97,68.48,-24.77],[0.40011,0.576588,0.659647,-0.268931],[1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget P412:=[[50.69,24.39,-1.19],[0.498465,0.528083,0.59789,-0.339395],[1,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget P422:=[[50.67,12.05,-1.17],[0.531512,0.506748,0.568414,-0.370955],[1,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget P432:=[[50.67,12.01,-22.19],[0.531513,0.506761,0.5684,-0.370958],[1,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget P442:=[[34.09,11.97,-22.27],[0.531487,0.50678,0.568391,-0.370981],[1,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget P452:=[[90.50,12.02,-13.56],[0.531507,0.506772,0.5684,-0.370949],[1,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget P110:=[[-4.42,9.51,-94.32],[0.400984,0.086427,0.911139,-0.0396067],[1,1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget P120:=[[-4.54,9.40,-15.31],[0.40089,0.0864578,0.911175,-0.0396552],[1,1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget P112:=[[-4.53,9.35,-53.85],[0.400866,0.08645,0.911186,-0.0396651],[1,1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget P522:=[[-241.28,28.00,170.09],[0.267068,-0.675166,0.624972,0.286767],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Sobre_calibrador:=[[-243.12,28.43,186.09],[0.262698,-0.677175,0.626826,0.281983],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget ponto_calibrador_Haas1:=[[-241.71,25.06,66.96],[0.262691,-0.677167,0.626837,0.281982],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	
	!***********************************************************
    !	Rotina Principal
    !***********************************************************
	PROC main()
		! Va para Home position
        HOME;
		! Se Garra 1 Aberta E nao fechada
        IF DI_16_Garra_1_Aberta=1 AND DI_17_Garra_1_Fechada=0 THEN
			! Pega peca na esteira
			PEG_PEC_EST_ENT;
		ENDIF
		! Aguarde até condicoes de entrada
		! DI_10_Falha_Haas_1 e DI_11_Falha_Haas_2 => Falha HAAS
		! DI_24_PortaHaas_1_Aberta e DI_27_PortaHaas_2_Aberta => Porta HAAS aberta
		! DI_14_RotinaHaas_1 e DI_15_RotinaHaas_2 => Rotina HAAS
        WaitUntil DI_10_Falha_Haas_1=0 and DI_24_PortaHaas_1_Aberta=1 and DI_14_RotinaHaas_1=1 OR DI_11_Falha_Haas_2=0 AND DI_27_PortaHaas_2_Aberta=1 AND DI_15_RotinaHaas_2=1;
		! Se tiver condicoes para HAAS 1
        IF DI_10_Falha_Haas_1=0 AND DI_24_PortaHaas_1_Aberta=1 AND DI_14_RotinaHaas_1=1 THEN
			!HAAS_1;
			HAAS_1Copy;
		ENDIF
		! Se tiver rotina para a HAAS 2
        IF DI_11_Falha_Haas_2=0 AND DI_27_PortaHaas_2_Aberta=1 AND DI_15_RotinaHaas_2=1 THEN
			HAAS_2;
		ENDIF
		! Va para home position
        HOME;
    ENDPROC
	!***********************************************************
    !	Rotina de Pega de peça na esteira de entrada
    !***********************************************************
	PROC PEG_PEC_EST_ENT()
		!Se Setup Rotina Haas-1 => 0
		IF DI_15_RotinaHaas_2=0 THEN
			MoveJ P007, v3000, z100, GARRA_1\WObj:=ESTEIRA_ENTRADA;
		ENDIF
		MoveJ pProxEsteiraEntrada10, v4000, z100, GARRA_1;
		MoveJ pProxEsteiraEntrada, v4000, z100, GARRA_1;
		MoveL P003, v5000, z10, GARRA_1\WObj:=ESTEIRA_ENTRADA;
		! Aguarda Sensor Esteira Entrada => 1
		WaitDI DI_20, 1;
		! Abre Garra-1
		ABRE_GARRA_1;
		MoveL P002, v500, z10, GARRA_1\WObj:=ESTEIRA_ENTRADA;
		MoveL p001, v50, fine, GARRA_1\WObj:=ESTEIRA_ENTRADA;
		! Fecha garra 1
		FECHAR_GARRA_1;
		MoveL P003, v200, z10, GARRA_1\WObj:=ESTEIRA_ENTRADA;
		MoveJ P004, v5000, z100, GARRA_1\WObj:=ESTEIRA_ENTRADA;
		MoveL P006, v5000, z100, GARRA_1\WObj:=ESTEIRA_ENTRADA;
		!Se Setup Rotina Haas-1 => 0
        IF DI_15_RotinaHaas_2=0 THEN 
			MoveJ P17, v5000, z100, GARRA_1\WObj:=ESTEIRA_ENTRADA;
			MoveJ P007, v5000, z100, GARRA_1\WObj:=ESTEIRA_ENTRADA;
			HOME;
        ENDIF
	ENDPROC
	!***********************************************************
    !	Rotina Fechar Garra 1
    !***********************************************************
	PROC FECHAR_GARRA_1()
		! Pulso Solenoide Fecha Garra 1
		PulseDO\PLength:=2, DO_24_FechaGarra_1;
		!Aguarda garra 1 nao aberta
		WaitDI DI_16_Garra_1_Aberta, 0;
		!Aguarda garra 1 fechada
		WaitDI DI_17_Garra_1_Fechada, 1;		
	ENDPROC
	!***********************************************************
    !	Rotina Fechar Garra 2
    !***********************************************************
	PROC FECHAR_GARRA_2()
		!Pulso solenoide Fecha Garra 2
		PulseDO\PLength:=2, DO_26_FechaGarra_2;
		!Aguarda garra 2 nao aberta
		WaitDI DI_30_Garra_2_Aberta, 0;
		!Aguarda garra 2 fechada
		WaitDI DI_31_Garra_2_Fechada, 1;		
	ENDPROC
	!***********************************************************
    !	Rotina Abrir Garra 2
    !***********************************************************
	PROC ABRE_GARRA_2()
        Reset DO_25_AbreGarra_2;
		!Pulso Solenoide Abre Garra 2
		PulseDO\PLength:=2, DO_25_AbreGarra_2;
		! Agurada Garra 2 nao Fechada
		WaitDI DI_31_Garra_2_Fechada, 0;
		! Aguarda Garra 2 Aberta
		WaitDI DI_30_Garra_2_Aberta, 1;
		
	ENDPROC
	!***********************************************************
    !	Rotina Abrir Garra 1
    !***********************************************************
	PROC ABRE_GARRA_1()
		!Pulso Solenoide abre Garra 1
		PulseDO\PLength:=2, DO_23_AbreGarra_1;
		! Aguarda Garra 1 nao Fechada
		WaitDI DI_17_Garra_1_Fechada, 0;
		! Agurada Garra 1 Aberta
		WaitDI DI_16_Garra_1_Aberta, 1;
		
	ENDPROC
	!***********************************************************
    !	Rotina Retirada e insercao de peca na HAAS 1
    !***********************************************************
	PROC HAAS_1()
		! Se Sensor Garra 1 Aberta E nao fechada...
        IF DI_16_Garra_1_Aberta=1 AND DI_17_Garra_1_Fechada=0 THEN
			!Vai pegar peca na esteira de entrada
			PEG_PEC_EST_ENT;
		ENDIF
		!Garante Garra 2 Aberta
		ABRE_GARRA_2;
		! Aguarda Porta HAAS 1 Aberta
		WaitDI DI_24_PortaHaas_1_Aberta, 1;
		!MoveJ P155, v5000, z100, GARRA_2\WObj:=WHAAS_1;
		! Entrando na HAAS 1
		MoveJ P154, v3000, z20, GARRA_2\WObj:=WHAAS_1;
		Set DO_13_EntrandoHaas_1;
		! Aguarda nao sensor meio da porta e porta aberta
        WaitUntil DI_32_SensorMeioPortaHaas_1=0 and DI_24_PortaHaas_1_Aberta=1;
		MoveL P153, v1500, z20, GARRA_2\WObj:=WHAAS_1;
		MoveL P152, v1000, fine, GARRA_2\WObj:=WHAAS_1;
		MoveL P151, v500, fine, GARRA_2\WObj:=WHAAS_1;
		MoveL P150, v200, fine, GARRA_2\WObj:=WHAAS_1;
		FECHAR_GARRA_2;
		MoveL P150, v10, fine, GARRA_2\WObj:=WHAAS_1;
		! Solicita abertura da castanha da HAAS 1
		ABRE_CAST_HAAS1;
		MoveL P151, v500, fine, GARRA_2\WObj:=WHAAS_1;
		MoveL P152, v1000, z10, GARRA_2\WObj:=WHAAS_1;
		!MoveL P418, v4000, fine, GARRA_2\WObj:=WHAAS_1;
		!MoveL P428, v4000, fine, GARRA_2\WObj:=WHAAS_1;
		!MoveL P418, v4000, fine, GARRA_2\WObj:=WHAAS_1;
		!MoveL P152, v1000, fine, GARRA_2\WObj:=WHAAS_1;
		! Liga o soprador da garra
		SOPRADOR_1;
		Set DO_20_Soprador;
		MoveL P102, v1000, fine, GARRA_1\WObj:=WHAAS_1;
		! Aguarda Castanha HAAS 1 Aberta
		WaitDI DI_22_CastanhaHaas_1_Aberta, 1;
		Reset DO_20_Soprador;
		MoveL P101, v500, fine, GARRA_1\WObj:=WHAAS_1;
		MoveL P100, v40, fine, GARRA_1\WObj:=WHAAS_1;
		ABRE_GARRA_1;
		MoveL P100, v10, fine, GARRA_1\WObj:=WHAAS_1;
		! Solicita fechamento castanha HAAS 1
		FECHA_CAST_HAAS1;
		! Aguarda fechamento da castanha
		WaitTime nTempoCastanha1;
		MoveL P101, v1000, fine, GARRA_1\WObj:=WHAAS_1;
		MoveL P102, v1000, z50, GARRA_1\WObj:=WHAAS_1;
		MoveL P153, v1500, z20, GARRA_2\WObj:=WHAAS_1;
		Reset DO_13_EntrandoHaas_1;
		MoveJ P154, v3000, fine, GARRA_2\WObj:=WHAAS_1;
		! Fora da HAAS1 
		! Aguarda o robô estar fora da HAAS
		WaitTime\InPos, 0.1;
		! Fim Rotina HAAS 1
        PulseDO\PLength:=2, DO_16_FimRotinaHaas_1;
		! Start ciclo da HAAS 1
        PulseDO\PLength:=2, DO_21_StartCicloHaas_1;
		! Vai pra home Position
        HOME;
        !Retirar apos teste calibrador
        !MEDICAO_CALB_HAAS1;
		! Se Contagem 70 Pecas HAAS 1
        IF DI_35_MedicaoHaas_1=1 AND DI_36=0 AND DI_40=0 THEN 
			MEDICAO_CALB_HAAS1;
		ENDIF
		! Se nao for medir
        IF DI_35_MedicaoHaas_1=0 AND DO_10_ZeraContadorHaas_1=0  THEN
			SOLTAPECA_SAIDA;
		ENDIF
		! Se Mediu
        IF DI_35_MedicaoHaas_1=1 OR DO_10_ZeraContadorHaas_1=1 THEN
			! Zera Contador HAAS 1
			Reset DO_10_ZeraContadorHaas_1;
			PulseDO\PLength:=2, DO_10_ZeraContadorHaas_1;
			HOME;
        ENDIF
	ENDPROC
	PROC HAAS_1Copy()
		! Se Sensor Garra 1 Aberta E nao fechada...
        IF DI_16_Garra_1_Aberta=1 AND DI_17_Garra_1_Fechada=0 THEN
			!Vai pegar peca na esteira de entrada
			PEG_PEC_EST_ENT;
		ENDIF
		!Garante Garra 2 Aberta
		ABRE_GARRA_2;
		! Aguarda Porta HAAS 1 Aberta
		WaitDI DI_24_PortaHaas_1_Aberta, 1;
		!MoveJ P155, v5000, z100, GARRA_2\WObj:=WHAAS_1;
		! Entrando na HAAS 1
		MoveJ P154, v3000, z20, GARRA_2\WObj:=WHAAS_1;
		Set DO_13_EntrandoHaas_1;
		! Aguarda nao sensor meio da porta e porta aberta
        WaitUntil DI_32_SensorMeioPortaHaas_1=0 and DI_24_PortaHaas_1_Aberta=1;
		MoveL P153, v1500, z20, GARRA_2\WObj:=WHAAS_1;
		MoveL P152, v1000, fine, GARRA_2\WObj:=WHAAS_1;
		MoveL P151, v500, fine, GARRA_2\WObj:=WHAAS_1;
		MoveL P150, v200, fine, GARRA_2\WObj:=WHAAS_1;
		FECHAR_GARRA_2;
		MoveL P150, v10, fine, GARRA_2\WObj:=WHAAS_1;
		! Solicita abertura da castanha da HAAS 1
		ABRE_CAST_HAAS1;
		MoveL P151, v500, fine, GARRA_2\WObj:=WHAAS_1;
		MoveL P152, v1000, z10, GARRA_2\WObj:=WHAAS_1;
		!MoveL P418, v4000, fine, GARRA_2\WObj:=WHAAS_1;
		!MoveL P428, v4000, fine, GARRA_2\WObj:=WHAAS_1;
		!MoveL P418, v4000, fine, GARRA_2\WObj:=WHAAS_1;
		!MoveL P152, v1000, fine, GARRA_2\WObj:=WHAAS_1;
		! Liga o soprador da garra
		SOPRADOR_1Copy;
		Set DO_20_Soprador;
		MoveL P102, v1000, fine, GARRA_1\WObj:=WHAAS_1;
		! Aguarda Castanha HAAS 1 Aberta
		WaitDI DI_22_CastanhaHaas_1_Aberta, 1;
		Reset DO_20_Soprador;
		MoveL P112, v1000, fine, GARRA_1\WObj:=WHAAS_1;
		MoveL P101, v500, z1, GARRA_1\WObj:=WHAAS_1;
		MoveL P100, v40, fine, GARRA_1\WObj:=WHAAS_1;
		ABRE_GARRA_1;
		MoveL P100, v10, z0, GARRA_1\WObj:=WHAAS_1;
		MoveL P110, v10, fine, GARRA_1\WObj:=WHAAS_1;
		! Solicita fechamento castanha HAAS 1
		FECHA_CAST_HAAS1;
		! Aguarda fechamento da castanha
		WaitTime nTempoCastanha1;
		MoveL P101, v1000, fine, GARRA_1\WObj:=WHAAS_1;
		MoveL P120, v1000, z50, GARRA_1\WObj:=WHAAS_1;
		MoveL P153, v1500, z20, GARRA_2\WObj:=WHAAS_1;
		Reset DO_13_EntrandoHaas_1;
		MoveJ P154, v3000, fine, GARRA_2\WObj:=WHAAS_1;
		! Fora da HAAS1 
		! Aguarda o robô estar fora da HAAS
		WaitTime\InPos, 0.1;
		! Fim Rotina HAAS 1
        PulseDO\PLength:=2, DO_16_FimRotinaHaas_1;
		! Start ciclo da HAAS 1
        PulseDO\PLength:=2, DO_21_StartCicloHaas_1;
		! Vai pra home Position
        HOME;
        !Retirar apos teste calibrador
        !MEDICAO_CALB_HAAS1;
		! Se Contagem 70 Pecas HAAS 1
        IF DI_35_MedicaoHaas_1=1 AND DI_36=0 AND DI_40=0 THEN 
			MEDICAO_CALB_HAAS1;
		ENDIF
		! Se nao for medir
        IF DI_35_MedicaoHaas_1=0 AND DO_10_ZeraContadorHaas_1=0  THEN
			SOLTAPECA_SAIDA;
		ENDIF
		! Se Mediu
        IF DI_35_MedicaoHaas_1=1 OR DO_10_ZeraContadorHaas_1=1 THEN
			! Zera Contador HAAS 1
			Reset DO_10_ZeraContadorHaas_1;
			PulseDO\PLength:=2, DO_10_ZeraContadorHaas_1;
			HOME;
        ENDIF
	ENDPROC
	!***********************************************************
    !	Rotina Retirada e insercao de pecas na HAAS 2
    !***********************************************************
	PROC HAAS_2()
		! Se 
        IF DI_16_Garra_1_Aberta=1 AND DI_17_Garra_1_Fechada=0 THEN
			PEG_PEC_EST_ENT;
		ENDIF
		! Se setup rotina HAAS 2
	    IF DI_15_RotinaHaas_2=0 THEN
			MoveL P213, v4000, z20, GARRA_2\WObj:=WHAAS_2;
		ENDIF
		MoveL P212, v4000, z10, GARRA_1\WObj:=WHAAS_2;
		! Aguarda nao sensor meio da porta e porta aberta
		WaitUntil DI_33_ErroHaas_2=0 and DI_27_PortaHaas_2_Aberta=1;
		ABRE_GARRA_2;
		! Aguarda Sensor porta HAAS 2 aberta
		WaitDI DI_27_PortaHaas_2_Aberta, 1;
		! Aguarda HAAS 2 nao em erro
		WaitDI DI_33_ErroHaas_2, 0;
		! Entrando na HAAS 2
		Set DO_15_EntrandoHaas_2;
		MoveL P211, v2500, fine, GARRA_1\WObj:=WHAAS_2;
		MoveL P202, v1500, fine, GARRA_2\WObj:=WHAAS_2;
		MoveL P201, v2000, z1, GARRA_2\WObj:=WHAAS_2;
		MoveL P200, v100, fine, GARRA_2\WObj:=WHAAS_2;
		! Fecha a garra
		FECHAR_GARRA_2;
		! Solicita abertura da castanha HAAS 2
		ABRE_CAST_HAAS2;
		MoveL P201, v150, fine, GARRA_2\WObj:=WHAAS_2;
		MoveL P202, v500, z10, GARRA_2\WObj:=WHAAS_2;
		! Liga soprador da garra
		SOPRADOR_2;
		Set DO_20_Soprador;
		MoveL P205, v1000, fine, GARRA_1\WObj:=WHAAS_2;
		! Aguarda Sinal castanha fechada
		WaitDI DI_25_CastanhaHaas_2_Aberta, 1;
		Reset DO_20_Soprador;
		MoveL P204, v200, fine, GARRA_1\WObj:=WHAAS_2;
		!MoveL P203, v40, fine, GARRA_1\WObj:=WHAAS_2;
		MoveL Offs(P203,5,0,0), v40, fine, GARRA_1\WObj:=WHAAS_2;
		! Abre garra com peca bruta
		ABRE_GARRA_1;
		! Solicita fechamento da castanha da HAAS 2
		FECHA_CAST_HAAS2;
		! Aguarda fechamento da castanha
		WaitTime nTempoCastanha2;
		MoveL P204, v500, z1, GARRA_1\WObj:=WHAAS_2;
		MoveL P205, v1000, z10, GARRA_1\WObj:=WHAAS_2;
		MoveL P206, v1000, z10, GARRA_1\WObj:=WHAAS_2;
		MoveL P211, v2000, z100, GARRA_1\WObj:=WHAAS_2;
		MoveL P212, v3000, z10, GARRA_1\WObj:=WHAAS_2;
		! Reset Dentro da HAAS 2
        MoveL P213, v3000, fine, GARRA_2\WObj:=WHAAS_2;
        Reset DO_15_EntrandoHaas_2;
		WaitTime\InPos,0;
		! Pulso em start ciclo
		PulseDO\PLength:=2, DO_22_StartCicloHaas_2;
		! Pulso em Fim da rotina HAAS 2
        PulseDO\PLength:=2, DO_17_FimRotinaHas_2;
        !Retirar apos teste calibrador
        !MEDICAO_CALB_HAAS2;
		! Se Contagem 70 pecas faca a medicao
        IF DI_37_MedicaoHaas_2=1 AND DI_40=0 AND DI_36=0 THEN
            MEDICAO_CALB_HAAS1;
        ENDIF
		! Se nao for medir
        IF DI_37_MedicaoHaas_2=0 AND DO_11_ZeraContadorHaas_2=0 THEN
            SOLTAPECA_SAIDA;
        ENDIF
		! Se mediu
        IF DI_37_MedicaoHaas_2=1 OR DO_11_ZeraContadorHaas_2=1 THEN
			Reset DO_11_ZeraContadorHaas_2;
            PulseDO\PLength:=2, DO_11_ZeraContadorHaas_2;
            HOME;
        ENDIF
	ENDPROC
	!***********************************************************
    !	Rotina Abre castanha HAAS 1
    !***********************************************************
	PROC ABRE_CAST_HAAS1()
		! Pulso em Abre castanha HAAS 1
		PulseDO\PLength:=2, DO_12_AbreFechaCastanhaHaas_1;
		! Aguarda castanha nao fechada
		!WaitDI DI_23_CastanhaHaas_1_Fechada, 0;
		! Aguarda Castanha Aberta
		WaitDI DI_22_CastanhaHaas_1_Aberta, 1;
	ENDPROC
	!***********************************************************
    !	Rotina Fecha Castanha HAAS 1
    !***********************************************************
	PROC FECHA_CAST_HAAS1()
		! Pulso em Fecha castanha HAAS 1
		PulseDO\PLength:=2, DO_12_AbreFechaCastanhaHaas_1;
		! Aguarda castanha nao aberta
		WaitDI DI_22_CastanhaHaas_1_Aberta, 0;
		! Aguarda castanha fechada
		WaitDI DI_23_CastanhaHaas_1_Fechada, 1;		
	ENDPROC
	!***********************************************************
    !	Rotina Abre castanha HAAS 2
    !***********************************************************
	PROC ABRE_CAST_HAAS2()
		! Pulso em abre/fecha castanha HAAS 2
		PulseDO\PLength:=2, DO_14_AbreFechaCastanhaHaas_2;
		! Aguarda castanha nao fechada
		WaitDI DI_26_CastanhaHaas_2_Fechada, 0;
		! Aguarda castanha aberta
		WaitDI DI_25_CastanhaHaas_2_Aberta, 1;
	ENDPROC
	!***********************************************************
    !	Rotina Abre castanha HAAS 2
    !***********************************************************
	PROC FECHA_CAST_HAAS2()
		! Pulso em abre/fecha castanha HAAS 2
		PulseDO\PLength:=2, DO_14_AbreFechaCastanhaHaas_2;
		! Aguarda castanha nao aberta
		WaitDI DI_25_CastanhaHaas_2_Aberta, 0;
		! Aguarda castanha fechada
		WaitDI DI_26_CastanhaHaas_2_Fechada, 1;
	ENDPROC
	!***********************************************************
    !	Rotina para ponto de home
    !***********************************************************
	PROC HOME()
		MoveJ Ponto_INIC, v4000, z50, tool0;
	ENDPROC
	!***********************************************************
    !	Rotina Soprador HAAS 2
    !***********************************************************
	PROC SOPRADOR_2()
		! Liga saida do soprador
		Set DO_20_Soprador;
		MoveJ P250, v1000, z1, SOPRADOR\WObj:=WHAAS_2;
		MoveJ P252, v1000, z1, SOPRADOR\WObj:=WHAAS_2;
		MoveJ P253, v1000, z1, SOPRADOR\WObj:=WHAAS_2;
		!MoveJ P254, v1000, z1, SOPRADOR\WObj:=WHAAS_2;
		!MoveJ P255, v1000, z1, SOPRADOR\WObj:=WHAAS_2;
		!MoveJ P256, v1000, z50, SOPRADOR\WObj:=WHAAS_2;
		!MoveJ P259, v1000, z50, SOPRADOR\WObj:=WHAAS_2;
		! Desliga saida do soprador
		Reset DO_20_Soprador;
		PulseDO\PLength:=2, DO_20_Soprador;
	ENDPROC
	!***********************************************************
    !	Rotina Deposito da peca na esteira de saida
    !***********************************************************
	PROC SOLTAPECA_SAIDA()
        ! Mede tempo do ciclo
        Clkstop clkTempoCiclo;
		nTempoCiclo:=ClkRead(clkTempoCiclo);
        ClkReset clkTempoCiclo;
        ClkStart clkTempoCiclo;
		! Liga sopro esteira
		MoveJ P025, v2500, z1, GARRA_2\WObj:=ESTEIRA_SAIDA;
		Set DO_30_SoproEsteira;
		! Aguarda Sensor da esteira saida 0 (Sem peca)
		WaitDI DI_21_EsteiraSaidaCheia, 0;
		MoveL P026, v100, fine, GARRA_2\WObj:=ESTEIRA_SAIDA;
		MoveL P025, v100, z1, GARRA_2\WObj:=ESTEIRA_SAIDA;
		WaitTime 0.5;
		MoveL P027, v5000, z1, GARRA_2\WObj:=ESTEIRA_SAIDA;
		! Desliga Soprador
		Reset DO_30_SoproEsteira;
		MoveL P024, v5000, fine, GARRA_2\WObj:=ESTEIRA_SAIDA;
		! Solta a peca
		!Pulso Solenoide Abre Garra 2
		PulseDO\PLength:=2, DO_25_AbreGarra_2;
		MoveL Offs(p024,0,0,100), v5000, z10, GARRA_2\WObj:=ESTEIRA_SAIDA;
		! MoveL P023, v1000, z1, GARRA_2\WObj:=ESTEIRA_SAIDA;
		!MoveJ P020, v3000, z100, GARRA_2\WObj:=ESTEIRA_SAIDA;
		HOME;
		ABRE_GARRA_2;
		!
	ENDPROC
	!***********************************************************
    !	Rotina de sopro (limpeza) na HAAS 1
    !***********************************************************
	PROC SOPRADOR_1()
		! Liga soprador da garra
		Set DO_20_Soprador;
		MoveL P400, v100, fine, GARRA_2\WObj:=WHAAS_1;
		MoveL P410, v100, fine, GARRA_2\WObj:=WHAAS_1;
		MoveL P420, v100, fine, GARRA_2\WObj:=WHAAS_1;
		MoveL P401, v100, fine, GARRA_2\WObj:=WHAAS_1;
		MoveL P411, v100, fine, GARRA_2\WObj:=WHAAS_1;
		MoveL P421, v100, fine, GARRA_2\WObj:=WHAAS_1;
		MoveL P402, v100, fine, GARRA_2\WObj:=WHAAS_1;
		MoveL P412, v100, fine, GARRA_2\WObj:=WHAAS_1;
		MoveL P422, v100, fine, GARRA_2\WObj:=WHAAS_1;
		MoveL P432, v100, fine, GARRA_2\WObj:=WHAAS_1;
		!MoveL P403, v1000, z1, GARRA_2\WObj:=WHAAS_1;
		!MoveL P404, v1000, z1, GARRA_2\WObj:=WHAAS_1;
		!MoveL P402, v1000, z1, GARRA_2\WObj:=WHAAS_1;
		!MoveL P401, v1000, z1, GARRA_2\WObj:=WHAAS_1;
		!MoveL P405, v1000, z1, GARRA_2\WObj:=WHAAS_1;
		!MoveL P406, v1000, z1, GARRA_2\WObj:=WHAAS_1;
		!MoveL P407, v1000, z1, GARRA_2\WObj:=WHAAS_1;
		MoveL P408, v200, fine, GARRA_2\WObj:=WHAAS_1;
		! Desliga Soprador da garra
		Reset DO_20_Soprador;
	ENDPROC
	PROC SOPRADOR_1Copy()
		! Liga soprador da garra
		Set DO_20_Soprador;
		MoveL P400, v100, fine, GARRA_2\WObj:=WHAAS_1;
		MoveL P410, v100, fine, GARRA_2\WObj:=WHAAS_1;
		MoveL P420, v100, fine, GARRA_2\WObj:=WHAAS_1;
		MoveL P401, v100, fine, GARRA_2\WObj:=WHAAS_1;
		MoveL P411, v100, fine, GARRA_2\WObj:=WHAAS_1;
		MoveL P421, v100, fine, GARRA_2\WObj:=WHAAS_1;
		MoveL P402, v100, fine, GARRA_2\WObj:=WHAAS_1;
		MoveL P412, v100, fine, GARRA_2\WObj:=WHAAS_1;
		MoveL P422, v100, fine, GARRA_2\WObj:=WHAAS_1;
		MoveL P432, v100, fine, GARRA_2\WObj:=WHAAS_1;
		MoveL P442, v100, fine, GARRA_2\WObj:=WHAAS_1;
		MoveL P452, v100, fine, GARRA_2\WObj:=WHAAS_1;
		!MoveL P403, v1000, z1, GARRA_2\WObj:=WHAAS_1;
		!MoveL P404, v1000, z1, GARRA_2\WObj:=WHAAS_1;
		!MoveL P402, v1000, z1, GARRA_2\WObj:=WHAAS_1;
		!MoveL P401, v1000, z1, GARRA_2\WObj:=WHAAS_1;
		!MoveL P405, v1000, z1, GARRA_2\WObj:=WHAAS_1;
		!MoveL P406, v1000, z1, GARRA_2\WObj:=WHAAS_1;
		!MoveL P407, v1000, z1, GARRA_2\WObj:=WHAAS_1;
		MoveL P408, v200, fine, GARRA_2\WObj:=WHAAS_1;
		! Desliga Soprador da garra
		Reset DO_20_Soprador;
	ENDPROC
	!***********************************************************
    !	Rotina de medicao da peca no passa/nao passa
    !***********************************************************
	PROC MEDICAO_CALB_HAAS1()
        SOPRO_INSP1;
        MoveL P504, v1000, z100, GARRA_2\WObj:=INSP;
		MoveL P503, v500, z40, GARRA_2\WObj:=INSP;
		MoveL P513, v500, z40, GARRA_2\WObj:=INSP;
		MoveL P523, v500, fine, GARRA_2\WObj:=INSP;
		ABRE_GARRA_2;
		MoveL P533, v500, fine, GARRA_2\WObj:=INSP;
		FECHAR_GARRA_2;
		WaitTime\InPos, 1;
		MoveL P543, v500, fine, GARRA_2\WObj:=INSP;
		MoveL Sobre_calibrador, v100, fine, GARRA_2\WObj:=INSP;
		MoveL P501, v10, fine, GARRA_2\WObj:=INSP;
		WaitTime 0.5;
		MoveL ponto_calibrador_Haas1, v10, fine, GARRA_2\WObj:=INSP;
		SoftDeact;
		WaitTime\InPos, 2;
        IF DI_36=1  THEN
        PulseDO\PLength:=2, DO_25_AbreGarra_2;
        Set DO_10_ZeraContadorHaas_1;
        MoveL P502, v20, fine, GARRA_2\WObj:=INSP;
        MoveL P503, v500, z40, GARRA_2\WObj:=INSP;
        MoveL P504, v1000, z100, GARRA_2\WObj:=INSP;
        HOME;
        ENDIF
        IF DI_36=0  THEN
        FECHAR_GARRA_2;
        MoveL P500, v10, fine, GARRA_2\WObj:=INSP;
        WaitTime 1;
        ENDIF
        IF DI_36=0  THEN
        MoveL P501, v10, fine, GARRA_2\WObj:=INSP;
        MoveL P503, v500, z40, GARRA_2\WObj:=INSP;
        MoveL P504, v1000, z100, GARRA_2\WObj:=INSP;
        SOLTAPECA_SAIDA;
        ENDIF
        IF DI_36=1 AND DO_10_ZeraContadorHaas_1=0 THEN
        PulseDO\PLength:=2, DO_25_AbreGarra_2;
        MoveL P501, v40, fine, GARRA_2\WObj:=INSP;
        MoveL P503, v500, z40, GARRA_2\WObj:=INSP;
        MoveL P504, v1000, z100, GARRA_2\WObj:=INSP;
        HOME;
        ENDIF
	ENDPROC
	!***********************************************************
    !	Rotina 
    !***********************************************************
	PROC MEDICAO_CALB_HAAS2()
        SOPRO_INSP1;
		MoveL P504, v1000, z100, GARRA_2\WObj:=INSP;
		MoveL P503, v500, z40, GARRA_2\WObj:=INSP;
		MoveL P553, v500, z40, GARRA_2\WObj:=INSP;
		MoveL P563, v500, fine, GARRA_2\WObj:=INSP;
		ABRE_GARRA_2;
		MoveL P573, v500, fine, GARRA_2\WObj:=INSP;
		FECHAR_GARRA_2;
		MoveL P583, v500, fine, GARRA_2\WObj:=INSP;
		MoveL P502, v100, fine, GARRA_2\WObj:=INSP;
		MoveL P501, v40, fine, GARRA_2\WObj:=INSP;
		MoveL P521, v40, fine, GARRA_2\WObj:=INSP;
        IF DI_40=1  THEN
        PulseDO\PLength:=2, DO_25_AbreGarra_2;
        Set DO_11_ZeraContadorHaas_2;
        MoveL P501, v40, fine, GARRA_2\WObj:=INSP;
        MoveL P502, v100, fine, GARRA_2\WObj:=INSP;
        MoveL P503, v500, z40, GARRA_2\WObj:=INSP;
        MoveL P504, v1000, z100, GARRA_2\WObj:=INSP;
        HOME;
        ENDIF
		IF DI_40=0  THEN
        MoveL P500, v10, fine, GARRA_2\WObj:=INSP;
        WaitTime 1;
        ENDIF
        IF DI_40=0  THEN
		MoveL P501, v40, fine, GARRA_2\WObj:=INSP;
		MoveL P502, v60, fine, GARRA_2\WObj:=INSP;
		MoveL P503, v500, z40, GARRA_2\WObj:=INSP;
		MoveL P504, v1000, z100, GARRA_2\WObj:=INSP;
        SOLTAPECA_SAIDA;
        ENDIF
        IF DI_40=1 AND DO_11_ZeraContadorHaas_2=0 THEN
        PulseDO\PLength:=2, DO_25_AbreGarra_2;
        MoveL P501, v40, fine, GARRA_2\WObj:=INSP;
        MoveL P502, v100, fine, GARRA_2\WObj:=INSP;
        MoveL P503, v500, z40, GARRA_2\WObj:=INSP;
        MoveL P504, v1000, z100, GARRA_2\WObj:=INSP;
        HOME;
        ENDIF
	ENDPROC
	!***********************************************************
    !	Rotina De lipeza da inspecao
    !***********************************************************
	PROC SOPRO_INSP1()
		MoveL p603, v1000, z100, SOPRADOR;
		MoveL p602, v1000, z100, SOPRADOR;
		! liga soprador Esteira
		Set DO_30_SoproEsteira;
		MoveL p601, v200, fine, SOPRADOR;
		MoveL p600, v40, fine, SOPRADOR;
		MoveL p601, v200, fine, SOPRADOR;
		MoveL p602, v1000, z100, SOPRADOR;
		! Desliga soprador Esteira
		Reset DO_30_SoproEsteira;
		MoveL p603, v1000, z100, SOPRADOR;
	ENDPROC
	PROC rSoft()
		SoftAct 3, 100;
	ENDPROC
ENDMODULE
