WHENEVER SQLERROR EXIT 1;
SET LINESIZE 1000;
SET PAGESIZE 0;
SET HEADING ON;
SET FEEDBACK OFF;
SET VERIFY OFF;
SET DOC OFF;
SET ECHO OFF;
set trims on;
SET TRIMSPOOL ON;
SET TERM OFF;
SET COLSEP '|';

SPOOL &1

select /*Req45946*/
       trim(hist.dn)  --- indica el dn del cliente   
       ||'|'||
       'N/A'          --- para el caso de las cadenas no existe un dn punto de venta.
       ||'|'|| 
       to_char(hist.fch_tran,'YYYYMMDD')
       ||'|'||
       hist.monto
from 
       stprod.ccomer_recarga_hist hist
where 
       hist.fch_tran >= to_date ('&1','yyyymmdd')
  and  hist.fch_tran <  to_date ('&2','yyyymmdd')
  and  hist.dn in
('2221000432'
,'2221165782'
,'2221179396'
,'2221266055'
,'2221436642'
,'2221439437'
,'2221474868'
,'2221478217'
,'2221495964'
,'2221497006'
,'2221497831'
,'2221562103'
,'2221653842'
,'2221658919'
,'2221662690'
,'2221664189'
,'2221667463'
,'2221667495'
,'2221678359'
,'2221727043'
,'2221731801'
,'2221735770'
,'2221744206'
,'2222751876'
,'2222754395'
,'2222754695'
,'2222757829'
,'2222763731'
,'2222769446'
,'2223123823'
,'2223125112'
,'2223125694'
,'2223128572'
,'2223130593'
,'2223133691'
,'2223138873'
,'2223145257'
,'2223146884'
,'2223153105'
,'2223153306'
,'2223158124'
,'2223167846'
,'2223191994'
,'2223355912'
,'2223366844'
,'2223491361'
,'2223548813'
,'2223833400'
,'2223841729'
,'2223842441'
,'2223862094'
,'2223863421'
,'2223863804'
,'2223868642'
,'2223873343'
,'2223877995'
,'2223878107'
,'2223880138'
,'2223885614'
,'2223891810'
,'2223893687'
,'2223896029'
,'2223904424'
,'2223908728'
,'2223908769'
,'2223945866'
,'2223949793'
,'2224014031'
,'2224017797'
,'2224106879'
,'2224112829'
,'2224113874'
,'2224144012'
,'2224146746'
,'2224153152'
,'2224163416'
,'2224163425'
,'2224167453'
,'2224172112'
,'2224173864'
,'2224175068'
,'2224221035'
,'2224461471'
,'2224483889'
,'2224485909'
,'2224492653'
,'2224498064'
,'2224506319'
,'2224641276'
,'2224872708'
,'2225177230'
,'2225229410'
,'2225347116'
,'2225420917'
,'2225428112'
,'2225428471'
,'2225431305'
,'2225437784'
,'2225487778'
,'2225560148'
,'2225560316'
,'2225560726'
,'2225561368'
,'2225561610'
,'2225562224'
,'2225562268'
,'2225562610'
,'2225562909'
,'2225563767'
,'2225564877'
,'2225565763'
,'2225565867'
,'2225565929'
,'2225566501'
,'2225567344'
,'2225567942'
,'2225567957'
,'2225568012'
,'2225568106'
,'2225568445'
,'2225568618'
,'2225568642'
,'2225568950'
,'2225569165'
,'2225572535'
,'2225572721'
,'2225573595'
,'2225574315'
,'2225576589'
,'2225578831'
,'2225581087'
,'2225586343'
,'2225590554'
,'2225592468'
,'2225603674'
,'2225607532'
,'2225608364'
,'2225608763'
,'2225610772'
,'2225614603'
,'2225783535'
,'2226060967'
,'2226065978'
,'2226067516'
,'2226067807'
,'2226067852'
,'2226071362'
,'2226072805'
,'2226072864'
,'2226074874'
,'2226077145'
,'2226083458'
,'2226086506'
,'2226092106'
,'2226100414'
,'2226104217'
,'2226112942'
,'2226119336'
,'2226119725'
,'2226119962'
,'2226129580'
,'2226132740'
,'2226135847'
,'2226260572'
,'2226260920'
,'2226261024'
,'2226261350'
,'2226261479'
,'2226261717'
,'2226263136'
,'2226263169'
,'2226264544'
,'2226264837'
,'2226266375'
,'2226266425'
,'2226266564'
,'2226266815'
,'2226266824'
,'2226267187'
,'2226267326'
,'2226267392'
,'2226267485'
,'2226268039'
,'2226268054'
,'2226268076'
,'2226268314'
,'2226268820'
,'2226268902'
,'2226269590'
,'2226269713'
,'2226270372'
,'2226270444'
,'2226270512'
,'2226270701'
,'2226271073'
,'2226271374'
,'2226271564'
,'2226271656'
,'2226271781'
,'2226271908'
,'2226272043'
,'2226272131'
,'2226272320'
,'2226272617'
,'2226273155'
,'2226273289'
,'2226273562'
,'2226274347'
,'2226274759'
,'2226276142'
,'2226276178'
,'2226276739'
,'2226276958'
,'2226277089'
,'2226277269'
,'2226277392'
,'2226282341'
,'2228671943'
,'2231045339'
,'2231045561'
,'2231047089'
,'2231047481'
,'2231070948'
,'2231076893'
,'2231076992'
,'2231077135'
,'2231077310'
,'2231077796'
,'2271033973'
,'2271034429'
,'2271057488'
,'2281008877'
,'2281150274'
,'2281153040'
,'2281158539'
,'2281161530'
,'2281163739'
,'2281232906'
,'2281239634'
,'2281317107'
,'2281362292'
,'2281364272'
,'2281365387'
,'2281376534'
,'2281449208'
,'2281831872'
,'2281843804'
,'2281848311'
,'2281850636'
,'2281853912'
,'2281855298'
,'2281870390'
,'2281875616'
,'2281889575'
,'2281961348'
,'2287771125'
,'2291013868'
,'2291176340'
,'2291324200'
,'2291351143'
,'2291353078'
,'2291355493'
,'2291359861'
,'2291360456'
,'2291361653'
,'2291362185'
,'2291362273'
,'2291364607'
,'2291364721'
,'2291413769'
,'2291416915'
,'2291532191'
,'2291620696'
,'2291626075'
,'2291634775'
,'2291636087'
,'2291636187'
,'2291637700'
,'2291639275'
,'2291642955'
,'2291643011'
,'2291706638'
,'2291708898'
,'2291811115'
,'2291812222'
,'2291812945'
,'2291816517'
,'2291819395'
,'2291822801'
,'2291824635'
,'2291830465'
,'2291831178'
,'2291838424'
,'2291842997'
,'2291845374'
,'2291849016'
,'2291854277'
,'2291859059'
,'2291859746'
,'2291861596'
,'2291864714'
,'2291868627'
,'2291870071'
,'2291871676'
,'2291872006'
,'2291873423'
,'2291873950'
,'2291875327'
,'2291877956'
,'2291881114'
,'2291885167'
,'2291892855'
,'2291896528'
,'2291897087'
,'2291898777'
,'2291905298'
,'2291905697'
,'2291905764'
,'2291907163'
,'2291907296'
,'2291908136'
,'2291908226'
,'2291909556'
,'2291910416'
,'2291914647'
,'2291916258'
,'2291919856'
,'2292195324'
,'2292205500'
,'2292205893'
,'2292302587'
,'2292306991'
,'2292311190'
,'2292315601'
,'2292322174'
,'2292326861'
,'2292327312'
,'2292332835'
,'2292335653'
,'2292340740'
,'2292342871'
,'2292345988'
,'2292347632'
,'2292349435'
,'2292352266'
,'2292358612'
,'2292359847'
,'2292365327'
,'2292368462'
,'2292380725'
,'2292384020'
,'2292384763'
,'2292386457'
,'2292523068'
,'2292530633'
,'2292531679'
,'2292536379'
,'2292536541'
,'2292538283'
,'2292540562'
,'2292541771'
,'2292542711'
,'2292553001'
,'2292555879'
,'2292555938'
,'2292556071'
,'2292558946'
,'2292559785'
,'2292560508'
,'2292560766'
,'2292561447'
,'2292562024'
,'2292565860'
,'2292569810'
,'2292570061'
,'2292574807'
,'2292581017'
,'2292586142'
,'2292599788'
,'2292671643'
,'2292675350'
,'2292676353'
,'2292678091'
,'2292684116'
,'2292689464'
,'2292702193'
,'2292702484'
,'2292702486'
,'2292703292'
,'2292703355'
,'2292703569'
,'2292704195'
,'2292704534'
,'2292704627'
,'2292705336'
,'2292705409'
,'2292705756'
,'2292705882'
,'2292706136'
,'2292706226'
,'2292706244'
,'2292706259'
,'2292706334'
,'2292706443'
,'2292706466'
,'2292706731'
,'2292707247'
,'2292707470'
,'2292707892'
,'2292708009'
,'2292708013'
,'2292708282'
,'2292708288'
,'2292708641'
,'2292708648'
,'2292708661'
,'2292709062'
,'2292709075'
,'2292709163'
,'2292709195'
,'2292709225'
,'2292709329'
,'2292709521'
,'2292709534'
,'2292884114'
,'2292884454'
,'2292884917'
,'2292885062'
,'2292885956'
,'2292886219'
,'2292887787'
,'2292888623'
,'2292889063'
,'2292890313'
,'2292890331'
,'2292890347'
,'2292892623'
,'2292892996'
,'2292897652'
,'2292901694'
,'2292901929'
,'2292902186'
,'2292902560'
,'2292906979'
,'2292907404'
,'2292914813'
,'2292915510'
,'2292917757'
,'2292925102'
,'2292925435'
,'2292925462'
,'2292928021'
,'2292929478'
,'2293029111'
,'2293029222'
,'2293029484'
,'2293029702'
,'2293030675'
,'2293033166'
,'2293033418'
,'2293033706'
,'2299048763'
,'2299112663'
,'2299134632'
,'2299302126'
,'2311041499'
,'2311041694'
,'2311042760'
,'2311043161'
,'2311044671'
,'2311050649'
,'2311051585'
,'2311058991'
,'2321030434'
,'2321030878'
,'2321031051'
,'2321031108'
,'2321031775'
,'2321033379'
,'2321033644'
,'2321033750'
,'2321036027'
,'2321050970'
,'2321053143'
,'2321055596'
,'2321056172'
,'2321056809'
,'2321059920'
,'2381032635'
,'2381051273'
,'2381051947'
,'2381052414'
,'2381053135'
,'2381055746'
,'2381058287'
,'2381090762'
,'2381120040'
,'2381120963'
,'2381122869'
,'2381124790'
,'2381125994'
,'2381160022'
,'2381165715'
,'2381165832'
,'2381168068'
,'2381168394'
,'2381186811'
,'2381202289'
,'2381210717'
,'2381211564'
,'2381213237'
,'2381213874'
,'2381216650'
,'2381219320'
,'2381284529'
,'2381301811'
,'2381303677'
,'2381303925'
,'2381305235'
,'2381305996'
,'2381310914'
,'2381311453'
,'2381312067'
,'2381313166'
,'2381314570'
,'2381314763'
,'2381314938'
,'2381315521'
,'2381316595'
,'2381401561'
,'2381411290'
,'2381419104'
,'2381419379'
,'2381420531'
,'2381422498'
,'2381424011'
,'2381424361'
,'2381425995'
,'2381426428'
,'2381426673'
,'2381427367'
,'2381427494'
,'2381428027'
,'2381429084'
,'2381440324'
,'2381445166'
,'2381445788'
,'2381446035'
,'2381446306'
,'2381446342'
,'2381446347'
,'2381447095'
,'2381447457'
,'2381447587'
,'2381447692'
,'2383891477'
,'2384095697'
,'2411051408'
,'2411062949'
,'2411066192'
,'2411067336'
,'2411067617'
,'2411110230'
,'2411112415'
,'2411112628'
,'2411112892'
,'2411114905'
,'2411115242'
,'2411115653'
,'2411117485'
,'2411119220'
,'2411250063'
,'2411252346'
,'2411252958'
,'2411254646'
,'2411254658'
,'2411254833'
,'2411270776'
,'2411272222'
,'2411273676'
,'2411275692'
,'2411275843'
,'2411276230'
,'2411276912'
,'2411276948'
,'2411279108'
,'2411279963'
,'2411331669'
,'2411331748'
,'2411331754'
,'2411331776'
,'2411331824'
,'2411331972'
,'2411333814'
,'2414192226'
,'2431020254'
,'2431020902'
,'2431021364'
,'2431022457'
,'2431023608'
,'2431024731'
,'2431027413'
,'2431040050'
,'2431040139'
,'2441051071'
,'2441054029'
,'2441056582'
,'2441071255'
,'2441072045'
,'2441075775'
,'2441075779'
,'2441077292'
,'2441077933'
,'2441093225'
,'2441106981'
,'2441140043'
,'2441140151'
,'2441140234'
,'2441145909'
,'2444492705'
,'2451026245'
,'2451028613'
,'2451052079'
,'2451053129'
,'2451054205'
,'2451056143'
,'2451064698'
,'2451082359'
,'2454507822'
,'2461050563'
,'2461053008'
,'2461053529'
,'2461082772'
,'2461083396'
,'2461084824'
,'2461085027'
,'2461124916'
,'2461130255'
,'2461136099'
,'2461138054'
,'2461138928'
,'2461140230'
,'2461141589'
,'2461147816'
,'2461190199'
,'2461191236'
,'2461195801'
,'2461196766'
,'2461196888'
,'2461197649'
,'2461197876'
,'2461199147'
,'2461200217'
,'2461204027'
,'2461207034'
,'2461320174'
,'2461322161'
,'2461322538'
,'2461322581'
,'2461323887'
,'2461325471'
,'2461325572'
,'2461326233'
,'2461326515'
,'2461329577'
,'2461380539'
,'2461382232'
,'2461382864'
,'2461387342'
,'2461387377'
,'2461387397'
,'2461387630'
,'2461387862'
,'2461390153'
,'2461390745'
,'2461391038'
,'2461391560'
,'2461393765'
,'2461397255'
,'2461403910'
,'2461406599'
,'2461407106'
,'2461430927'
,'2461431214'
,'2461435537'
,'2461436320'
,'2461439704'
,'2461439737'
,'2461439819'
,'2461439859'
,'2461545942'
,'2461550411'
,'2461550783'
,'2461550951'
,'2461551159'
,'2461551327'
,'2461551689'
,'2461551696'
,'2461551797'
,'2461552050'
,'2461552068'
,'2461552075'
,'2461552114'
,'2461552260'
,'2461552968'
,'2461553012'
,'2461553077'
,'2461553123'
,'2461553762'
,'2461553841'
,'2461553888'
,'2461554446'
,'2461554681'
,'2461554708'
,'2461554728'
,'2461554955'
,'2471032545'
,'2471032725'
,'2471036460'
,'2471036948'
,'2471050620'
,'2471052399'
,'2471054421'
,'2471054541'
,'2471054761'
,'2471054779'
,'2471054794'
,'2471055006'
,'2471055166'
,'2471055183'
,'2471055324'
,'2471055339'
,'2471055561'
,'2471055856'
,'2471055867'
,'2471056224'
,'2471092428'
,'2471092980'
,'2481056039'
,'2481089120'
,'2481100559'
,'2481102354'
,'2481103587'
,'2481107202'
,'2481130624'
,'2481131118'
,'2481132241'
,'2481132258'
,'2481136074'
,'2481138263'
,'2481139009'
,'2481139115'
,'2481232701'
,'2481235135'
,'2481238474'
,'2481275049'
,'2481275208'
,'2481275432'
,'2481276287'
,'2481277724'
,'2481279079'
,'2481312191'
,'2481315220'
,'2481316963'
,'2481317659'
,'2481317980'
,'2481335916'
,'2481338643'
,'2481340497'
,'2481348079'
,'2481349007'
,'2481361574'
,'2481361837'
,'2481361877'
,'2481361980'
,'2481362018'
,'2481362023'
,'2481362105'
,'2481362122'
,'2481362184'
,'2481362784'
,'2481362914'
,'2481363063'
,'2481363497'
,'2481363535'
,'2481364253'
,'2481364351'
,'2481364368'
,'2481364464'
,'2481364654'
,'2481365652'
,'2481365687'
,'2481365758'
,'2481366188'
,'2481367483'
,'2484913535'
,'2491093006'
,'2491093801'
,'2491093974'
,'2491095328'
,'2491095910'
,'2491095929'
,'2491096160'
,'2491096238'
,'2491097895'
,'2491179416'
,'2491179576'
,'2491202511'
,'2491202699'
,'2491205006'
,'2491205440'
,'2491206014'
,'2491207698'
,'2491207970'
,'2491208641'
,'2491208756'
,'2491231660'
,'2491232756'
,'2491234375'
,'2491235693'
,'2491236022'
,'2491238329'
,'2491238926'
,'2491239474'
,'2491270298'
,'2491274018'
,'2491274471'
,'2491274541'
,'2491274694'
,'2491274973'
,'2491275121'
,'2491275319'
,'2491275365'
,'2491275414'
,'2711007992'
,'2711074957'
,'2711101920'
,'2711107263'
,'2711108146'
,'2711109479'
,'2711109696'
,'2711111743'
,'2711111750'
,'2711114133'
,'2711116171'
,'2711117807'
,'2711117997'
,'2711150897'
,'2711155354'
,'2711156393'
,'2711157122'
,'2711159412'
,'2711162233'
,'2711168008'
,'2711169369'
,'2711187406'
,'2711244053'
,'2711248723'
,'2711290473'
,'2711291228'
,'2711292375'
,'2711294365'
,'2711294669'
,'2711298328'
,'2711299492'
,'2711300315'
,'2711301807'
,'2711310459'
,'2711310478'
,'2711312240'
,'2711314216'
,'2711315623'
,'2711315657'
,'2711325044'
,'2711325849'
,'2711329147'
,'2711329982'
,'2711344444'
,'2711360352'
,'2711360415'
,'2711361339'
,'2711367704'
,'2711367916'
,'2711368776'
,'2711368795'
,'2711371334'
,'2711371422'
,'2711371607'
,'2711372109'
,'2711372272'
,'2711372612'
,'2711375688'
,'2711375724'
,'2711379473'
,'2711414338'
,'2711414744'
,'2711415954'
,'2711416363'
,'2711417461'
,'2711420171'
,'2711420396'
,'2711423393'
,'2711424803'
,'2711427846'
,'2711452194'
,'2711455695'
,'2711457004'
,'2711457980'
,'2711459422'
,'2711470025'
,'2711473260'
,'2711475168'
,'2711477298'
,'2711478168'
,'2711485517'
,'2711501044'
,'2711501123'
,'2711501348'
,'2711501807'
,'2711503130'
,'2717067901'
,'2717184588'
,'2721083701'
,'2721084625'
,'2721085198'
,'2721085260'
,'2721086433'
,'2721090258'
,'2721092341'
,'2721092536'
,'2721092931'
,'2721095219'
,'2721185012'
,'2721188668'
,'2721190761'
,'2721243350'
,'2721250153'
,'2721287641'
,'2721300084'
,'2721324765'
,'2721325831'
,'2721328221'
,'2721329980'
,'2721330866'
,'2721337565'
,'2721338424'
,'2721387089'
,'2721423059'
,'2721424376'
,'2721430920'
,'2721433294'
,'2721436790'
,'2721437994'
,'2721438862'
,'2721440138'
,'2721441901'
,'2721449031'
,'2721449259'
,'2721450864'
,'2721452288'
,'2721454507'
,'2721455960'
,'2721495795'
,'2721495799'
,'2721496705'
,'2721496759'
,'2721497277'
,'2721497547'
,'2721497591'
,'2721497606'
,'2721498067'
,'2721498077'
,'2721498162'
,'2727037044'
,'2727050646'
,'2727192352'
,'2727196830'
,'2727208546'
,'2727844992'
,'2741020230'
,'2741021630'
,'2741022315'
,'2741022455'
,'2741022610'
,'2741024692'
,'2741025099'
,'2741026702'
,'2741027296'
,'2741027617'
,'2741040532'
,'2741070324'
,'2741077116'
,'2741077855'
,'2741078317'
,'2741078398'
,'2741078565'
,'2741121066'
,'2741121989'
,'2741124356'
,'2741124464'
);

SPOOL OFF;
QUIT;
