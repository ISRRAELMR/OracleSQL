
100370
200255
200187
200461
100110
200344
100932
200179
100013
200264


MASTERCEL S.A DE C V.

select * from stsre.company

select * from stsre.sud_medusa_distribuidor
  where
    company_id = 100370
    
 select * from stsre.sre_ppvv   
    where
        di=200255
and nivel=1     

select * from stsre.sud_medusa_distribuidor
  where
id_usuario=11332  

 select * from stsre.sre_ppvv   
    where
        cve_usuario_padre=200461
           
and nivel=1   

MOVILWAY SA DE CV
Oiracel S.A. de C.V.

        
select /*Req44946*/
       ppvv.cve_usuario
       ||'|'||
       ppvv.nivel
       ||'|'||
       usu.usuario
       ||'|'||
       usu.nombre_razon_social
 from 
       stsre.sre_ppvv ppvv,
       stsre.sre_usuario usu 
where 
       ppvv.di= 200255 
   and ppvv.nivel = 2
   and ppvv.cve_usuario = usu.cve_usuario        
   
   
   select y.cve_usuario    
                   from stsre.sre_usuario y 
        where y.cve_usuario = 64117
   
                                 select x.cve_usuario  
                                  from stsre.sre_ppvv x start with x.cve_usuario 
                                       in( select y.cve_usuario    
                                             from stsre.sre_usuario y 
                                            where y.cve_usuario =64117 --el valor de este parametro  equivale a cada uno de  los 85 distribuidores del nivel 2 de movilway
                                         ) 
                                     CONNECT BY PRIOR x.cve_usuario = x.cve_usuario_padre
                                     
                                     
                                       select x.cve_usuario  
                                  from stsre.sre_ppvv x start with x.cve_usuario 
                                       in( 64117) --el valor de este parametro  equivale a cada uno de  los 85 distribuidores del nivel 2 de movilway
                                     CONNECT BY PRIOR x.cve_usuario = x.cve_usuario_padre
                                     
                                     minus                             
                                      select x.cve_usuario  
                                  from stsre.sre_ppvv x 
                                  where x.cve_usuario_padre = 64117 --el valor de este parametro  equivale a cada uno de  los 85 distribuidores del nivel 2 de movilway
                                  
                                     CONNECT BY PRIOR x.cve_usuario = x.cve_usuario_padre
                                     
                                     


select /*Req44946*/
      '&2'
      ||'|'||
      A.fecha
      ||'|'||
      A.monto_total
      ||'|'||
      A.distribuidor
from 
      (
       select  /* ordered */
              to_char(a.fch_transaccion,'yyyymmdd') fecha,
              sum(nvl(a.monto,0)) monto_total,
              b.di distribuidor
        from   
              stsre.sre_transaccion a,  
              stsre.sre_recarga_electronica e,
              stsre.SRE_PPVV b,
              stsre.sre_usuario  c  
       where  
              a.FCH_TRANSACCION >= TO_DATE ('20120604','yyyymmdd')
         and  a.FCH_TRANSACCION <  TO_DATE ('20120604','yyyymmdd') + 1
         and  a.cve_transaccion = e.cve_transaccion
         and  a.cve_tipo_concepto = 2    ---- indica que la transaccion realizada fue una recarga
         and  a.cve_usuario = c.cve_usuario
         and  c.cve_usuario = b.cve_usuario
         and  b.cve_usuario IN (select x.cve_usuario  
  from stsre.sre_ppvv x start with x.cve_usuario 
         in(
  select /*Req44946*/
       ppvv.cve_usuario
    from 
       stsre.sre_ppvv ppvv
where 
       ppvv.di= 200255 
   and ppvv.nivel = 2  )
  CONNECT BY PRIOR x.cve_usuario = x.cve_usuario_padre
                               )                          
         group by 
                   to_char(a.fch_transaccion,'yyyymmdd'),    
                   b.di
      ) A                                     
      
      
 


(select x.cve_usuario  
  from stsre.sre_ppvv x start with x.cve_usuario 
         in(
  select /*Req44946*/
       ppvv.cve_usuario
    from 
       stsre.sre_ppvv ppvv
where 
       ppvv.di= 200255 
   and ppvv.nivel = 2  )
  CONNECT BY PRIOR x.cve_usuario = x.cve_usuario_padre
                               )
                               
                               
                               
select /*Req44946*/
      '&2'
      ||'|'||
      A.fecha
      ||'|'||
      A.monto_total
      ||'|'||
      A.distribuidor
from 
      (
       select  /*+  use_nl(a b c e) ordered*/
              to_char(a.fch_transaccion,'yyyymmdd') fecha,
              sum(nvl(a.monto,0)) monto_total,
              b.di distribuidor
        from   
              stsre.sre_transaccion a,  
              stsre.SRE_PPVV b,
              stsre.sre_usuario  c,
              stsre.sre_recarga_electronica e  
       where  
              a.FCH_TRANSACCION >= TO_DATE ('20120603','yyyymmdd')
         and  a.FCH_TRANSACCION <  TO_DATE ('20120603','yyyymmdd') + 1
         and  a.cve_transaccion = e.cve_transaccion
         and  a.cve_tipo_concepto = 2    ---- indica que la transaccion realizada fue una recarga
         and  a.cve_usuario = b.cve_usuario
         and  b.di= 200255    -- Distribuidor Movilway     CELUSTAR
         and  b.nivel = 2
         and  a.cve_usuario = c.cve_usuario
         group by 
                   to_char(a.fch_transaccion,'yyyymmdd'),    
                   b.di
      ) A

-- distribuidores nivel 2 de Movil Way y sus hijos , 86 nivel 2 


select /*Req44946*/
       ppvv.cve_usuario
    from 
       stsre.sre_ppvv ppvv
where 
       ppvv.di= 200255 
   and ppvv.nivel = 2   
   and ppvv.cve_usuario=64117
minus
select /*Req44946*/
       ppvv.cve_usuario, ppvv2.cve_usuario
    from 
       stsre.sre_ppvv ppvv, stsre.sre_ppvv ppvv2
where 
       ppvv.di= 200255 
   and ppvv.nivel = 2   
   and ppvv.cve_usuario=64117
   and PPVV.CVE_USUARIO=PPVV2.CVE_USUARIO_PADRE     
   
   
  select * from stsre.ccomer_recarga 
    where
       dn='522461399475'
       
   select * from stsre.ccomer_recarga 
    where
       dn='522461192465'      

   select * from stsre.ccomer_recarga 
    where
       dn='522461395370'                               

 cadena_id=2090295  
 
 select * from stsre.sre_ppvv
    where
       di =200255
  and nivel = 1     
 
 select * from stsre.sud_medusa_distribuidor
    where
      id_usuario=534064
      
 select * from stsre.company
   where
       company_id = 7000700     
 
 MOVILWAY SA DE CV
 MASTERCEL S.A DE C V.
 Oiracel S.A. de C.V.
 SERGIO ANDRES PEREZ RODRIGUEZ
 


        select b.di, count(1), sum(monto) from   
              stsre.sre_transaccion a ,   stsre.SRE_PPVV b
       where  
              a.FCH_TRANSACCION >= TO_DATE ('20120603','yyyymmdd')
         and  a.FCH_TRANSACCION <  TO_DATE ('20120603','yyyymmdd') + 1
         and a.cve_usuario = b.cve_usuario
        -- AND  b.nivel = 1
        group by b.di
        
        