(* Created by Wolfram Mathematica 9.0 : www.wolfram.com *)
rateconst["HK12", True]*((parameter["HKtot"]*rateconst["HK1", True]*
    rateconst["HK10", True]*rateconst["HK11", True]*rateconst["HK12", True]*
    rateconst["HK2", True]*rateconst["HK3", True]*rateconst["HK4", True]*
    rateconst["HK5", True]*rateconst["HK6", True]^2*rateconst["HK7", True]^2*
    rateconst["HK8", True]*(rateconst["HK1", False] + 
     metabolite["atp", "c"]*rateconst["HK8", True])*rateconst["HK9", True]*
    rateconst["Sink_23dpg[c]", True]*rateconst["Sink_adp[c]", True]*
    rateconst["Sink_atp[c]", True]*rateconst["Sink_g6p[c]", True]*
    rateconst["Sink_glc-D[c]", True]*rateconst["Sink_gthrd[c]", True]*
    rateconst["Sink_pi[c]", True]*(metabolite["glc-D", "c"]*
      rateconst["HK6", True]*rateconst["HK7", True]*
      (rateconst["HK1", False] + metabolite["atp", "c"]*
        rateconst["HK8", True])*rateconst["HK9", False]*
      rateconst["HK9", True]*(rateconst["HK10", True] + 
       rateconst["HK11", True] + (rateconst["HK1", True]*
         rateconst["HK10", True]*rateconst["HK11", True]*
         rateconst["HK12", True]*rateconst["HK2", True]*
         rateconst["HK3", True]*rateconst["HK4", True]*rateconst["HK5", True]*
         rateconst["HK6", True]*rateconst["HK7", True]*rateconst["HK8", True]*
         rateconst["HK9", True]*rateconst["Sink_23dpg[c]", True]*
         rateconst["Sink_adp[c]", True]*rateconst["Sink_atp[c]", True]*
         rateconst["Sink_g6p[c]", True]*rateconst["Sink_glc-D[c]", True]*
         rateconst["Sink_gthrd[c]", True]*rateconst["Sink_pi[c]", True])/
        (250*rateconst["HK1", False]*rateconst["HK10", False]*
         rateconst["HK11", False]*rateconst["HK2", False]*
         rateconst["HK3", False]*rateconst["HK4", False]*
         rateconst["HK5", False]*rateconst["HK6", False]*
         rateconst["HK7", False]*rateconst["HK8", False]*
         rateconst["HK9", False]*rateconst["Sink_23dpg[c]", False]*
         rateconst["Sink_adp[c]", False]*rateconst["Sink_atp[c]", False]*
         rateconst["Sink_g6p[c]", False]*rateconst["Sink_glc-D[c]", False]*
         rateconst["Sink_gthrd[c]", False]*rateconst["Sink_pi[c]", False])) - 
     (rateconst["HK2", False] + metabolite["glc-D", "c"]*
        rateconst["HK9", True])*(-(metabolite["atp", "c"]*
         rateconst["HK6", True]*rateconst["HK7", True]*rateconst["HK8", 
          False]*rateconst["HK8", True]*(rateconst["HK10", True] + 
          rateconst["HK11", True] + (rateconst["HK1", True]*
            rateconst["HK10", True]*rateconst["HK11", True]*
            rateconst["HK12", True]*rateconst["HK2", True]*rateconst["HK3", 
             True]*rateconst["HK4", True]*rateconst["HK5", True]*
            rateconst["HK6", True]*rateconst["HK7", True]*rateconst["HK8", 
             True]*rateconst["HK9", True]*rateconst["Sink_23dpg[c]", True]*
            rateconst["Sink_adp[c]", True]*rateconst["Sink_atp[c]", True]*
            rateconst["Sink_g6p[c]", True]*rateconst["Sink_glc-D[c]", True]*
            rateconst["Sink_gthrd[c]", True]*rateconst["Sink_pi[c]", True])/
           (250*rateconst["HK1", False]*rateconst["HK10", False]*
            rateconst["HK11", False]*rateconst["HK2", False]*
            rateconst["HK3", False]*rateconst["HK4", False]*
            rateconst["HK5", False]*rateconst["HK6", False]*
            rateconst["HK7", False]*rateconst["HK8", False]*
            rateconst["HK9", False]*rateconst["Sink_23dpg[c]", False]*
            rateconst["Sink_adp[c]", False]*rateconst["Sink_atp[c]", False]*
            rateconst["Sink_g6p[c]", False]*rateconst["Sink_glc-D[c]", False]*
            rateconst["Sink_gthrd[c]", False]*rateconst["Sink_pi[c]", 
             False]))) + (rateconst["HK1", False] + metabolite["atp", "c"]*
          rateconst["HK8", True])*
        (-(rateconst["HK1", True]*rateconst["HK10", True]*rateconst["HK11", 
             True]*rateconst["HK12", True]^2*rateconst["HK2", True]*
            rateconst["HK3", True]*rateconst["HK4", True]*rateconst["HK5", 
             True]*rateconst["HK6", True]^2*rateconst["HK7", True]^2*
            rateconst["HK8", True]*rateconst["HK9", True]*
            rateconst["Sink_23dpg[c]", True]*rateconst["Sink_adp[c]", True]*
            rateconst["Sink_atp[c]", True]*rateconst["Sink_g6p[c]", True]*
            rateconst["Sink_glc-D[c]", True]*rateconst["Sink_gthrd[c]", True]*
            rateconst["Sink_pi[c]", True])/(250*rateconst["HK1", False]*
           rateconst["HK10", False]*rateconst["HK11", False]*
           rateconst["HK2", False]*rateconst["HK3", False]*
           rateconst["HK4", False]*rateconst["HK5", False]*
           rateconst["HK6", False]*rateconst["HK7", False]*
           rateconst["HK8", False]*rateconst["HK9", False]*
           rateconst["Sink_23dpg[c]", False]*rateconst["Sink_adp[c]", False]*
           rateconst["Sink_atp[c]", False]*rateconst["Sink_g6p[c]", False]*
           rateconst["Sink_glc-D[c]", False]*rateconst["Sink_gthrd[c]", 
            False]*rateconst["Sink_pi[c]", False]) + rateconst["HK6", True]*
          rateconst["HK7", True]*(rateconst["HK12", True] + 
           rateconst["HK8", False] + rateconst["HK9", False])*
          (rateconst["HK10", True] + rateconst["HK11", True] + 
           (rateconst["HK1", True]*rateconst["HK10", True]*rateconst["HK11", 
              True]*rateconst["HK12", True]*rateconst["HK2", True]*
             rateconst["HK3", True]*rateconst["HK4", True]*rateconst["HK5", 
              True]*rateconst["HK6", True]*rateconst["HK7", True]*
             rateconst["HK8", True]*rateconst["HK9", True]*
             rateconst["Sink_23dpg[c]", True]*rateconst["Sink_adp[c]", True]*
             rateconst["Sink_atp[c]", True]*rateconst["Sink_g6p[c]", True]*
             rateconst["Sink_glc-D[c]", True]*rateconst["Sink_gthrd[c]", 
              True]*rateconst["Sink_pi[c]", True])/(250*rateconst["HK1", 
              False]*rateconst["HK10", False]*rateconst["HK11", False]*
             rateconst["HK2", False]*rateconst["HK3", False]*
             rateconst["HK4", False]*rateconst["HK5", False]*
             rateconst["HK6", False]*rateconst["HK7", False]*
             rateconst["HK8", False]*rateconst["HK9", False]*
             rateconst["Sink_23dpg[c]", False]*rateconst["Sink_adp[c]", 
              False]*rateconst["Sink_atp[c]", False]*rateconst["Sink_g6p[c]", 
              False]*rateconst["Sink_glc-D[c]", False]*rateconst[
              "Sink_gthrd[c]", False]*rateconst["Sink_pi[c]", False])))))*
    (metabolite["atp", "c"]*rateconst["HK2", True] - 
     ((rateconst["HK2", False] + metabolite["glc-D", "c"]*
         rateconst["HK9", True])*(metabolite["atp", "c"]*
         metabolite["glc-D", "c"]*rateconst["HK1", True]*
         rateconst["HK6", True]*rateconst["HK7", True]*rateconst["HK8", True]*
         rateconst["HK9", False]*(rateconst["HK10", True] + 
          rateconst["HK11", True] + (rateconst["HK1", True]*
            rateconst["HK10", True]*rateconst["HK11", True]*
            rateconst["HK12", True]*rateconst["HK2", True]*rateconst["HK3", 
             True]*rateconst["HK4", True]*rateconst["HK5", True]*
            rateconst["HK6", True]*rateconst["HK7", True]*rateconst["HK8", 
             True]*rateconst["HK9", True]*rateconst["Sink_23dpg[c]", True]*
            rateconst["Sink_adp[c]", True]*rateconst["Sink_atp[c]", True]*
            rateconst["Sink_g6p[c]", True]*rateconst["Sink_glc-D[c]", True]*
            rateconst["Sink_gthrd[c]", True]*rateconst["Sink_pi[c]", True])/
           (250*rateconst["HK1", False]*rateconst["HK10", False]*
            rateconst["HK11", False]*rateconst["HK2", False]*
            rateconst["HK3", False]*rateconst["HK4", False]*
            rateconst["HK5", False]*rateconst["HK6", False]*
            rateconst["HK7", False]*rateconst["HK8", False]*
            rateconst["HK9", False]*rateconst["Sink_23dpg[c]", False]*
            rateconst["Sink_adp[c]", False]*rateconst["Sink_atp[c]", False]*
            rateconst["Sink_g6p[c]", False]*rateconst["Sink_glc-D[c]", False]*
            rateconst["Sink_gthrd[c]", False]*rateconst["Sink_pi[c]", 
             False])) + metabolite["atp", "c"]*rateconst["HK2", True]*
         (-(metabolite["atp", "c"]*rateconst["HK6", True]*rateconst["HK7", 
             True]*rateconst["HK8", False]*rateconst["HK8", True]*
            (rateconst["HK10", True] + rateconst["HK11", True] + 
             (rateconst["HK1", True]*rateconst["HK10", True]*rateconst[
                "HK11", True]*rateconst["HK12", True]*rateconst["HK2", True]*
               rateconst["HK3", True]*rateconst["HK4", True]*rateconst["HK5", 
                True]*rateconst["HK6", True]*rateconst["HK7", True]*rateconst[
                "HK8", True]*rateconst["HK9", True]*rateconst[
                "Sink_23dpg[c]", True]*rateconst["Sink_adp[c]", True]*
               rateconst["Sink_atp[c]", True]*rateconst["Sink_g6p[c]", True]*
               rateconst["Sink_glc-D[c]", True]*rateconst["Sink_gthrd[c]", 
                True]*rateconst["Sink_pi[c]", True])/(250*rateconst["HK1", 
                False]*rateconst["HK10", False]*rateconst["HK11", False]*
               rateconst["HK2", False]*rateconst["HK3", False]*rateconst[
                "HK4", False]*rateconst["HK5", False]*rateconst["HK6", False]*
               rateconst["HK7", False]*rateconst["HK8", False]*rateconst[
                "HK9", False]*rateconst["Sink_23dpg[c]", False]*rateconst[
                "Sink_adp[c]", False]*rateconst["Sink_atp[c]", False]*
               rateconst["Sink_g6p[c]", False]*rateconst["Sink_glc-D[c]", 
                False]*rateconst["Sink_gthrd[c]", False]*rateconst[
                "Sink_pi[c]", False]))) + (rateconst["HK1", False] + 
            metabolite["atp", "c"]*rateconst["HK8", True])*
           (-(rateconst["HK1", True]*rateconst["HK10", True]*rateconst[
                "HK11", True]*rateconst["HK12", True]^2*rateconst["HK2", 
                True]*rateconst["HK3", True]*rateconst["HK4", True]*rateconst[
                "HK5", True]*rateconst["HK6", True]^2*rateconst["HK7", True]^
                2*rateconst["HK8", True]*rateconst["HK9", True]*rateconst[
                "Sink_23dpg[c]", True]*rateconst["Sink_adp[c]", True]*
               rateconst["Sink_atp[c]", True]*rateconst["Sink_g6p[c]", True]*
               rateconst["Sink_glc-D[c]", True]*rateconst["Sink_gthrd[c]", 
                True]*rateconst["Sink_pi[c]", True])/(250*rateconst["HK1", 
               False]*rateconst["HK10", False]*rateconst["HK11", False]*
              rateconst["HK2", False]*rateconst["HK3", False]*
              rateconst["HK4", False]*rateconst["HK5", False]*
              rateconst["HK6", False]*rateconst["HK7", False]*
              rateconst["HK8", False]*rateconst["HK9", False]*
              rateconst["Sink_23dpg[c]", False]*rateconst["Sink_adp[c]", 
               False]*rateconst["Sink_atp[c]", False]*rateconst[
               "Sink_g6p[c]", False]*rateconst["Sink_glc-D[c]", False]*
              rateconst["Sink_gthrd[c]", False]*rateconst["Sink_pi[c]", 
               False]) + rateconst["HK6", True]*rateconst["HK7", True]*
             (rateconst["HK12", True] + rateconst["HK8", False] + 
              rateconst["HK9", False])*(rateconst["HK10", True] + 
              rateconst["HK11", True] + (rateconst["HK1", True]*rateconst[
                 "HK10", True]*rateconst["HK11", True]*rateconst["HK12", 
                 True]*rateconst["HK2", True]*rateconst["HK3", True]*
                rateconst["HK4", True]*rateconst["HK5", True]*rateconst[
                 "HK6", True]*rateconst["HK7", True]*rateconst["HK8", True]*
                rateconst["HK9", True]*rateconst["Sink_23dpg[c]", True]*
                rateconst["Sink_adp[c]", True]*rateconst["Sink_atp[c]", True]*
                rateconst["Sink_g6p[c]", True]*rateconst["Sink_glc-D[c]", 
                 True]*rateconst["Sink_gthrd[c]", True]*rateconst[
                 "Sink_pi[c]", True])/(250*rateconst["HK1", False]*
                rateconst["HK10", False]*rateconst["HK11", False]*
                rateconst["HK2", False]*rateconst["HK3", False]*rateconst[
                 "HK4", False]*rateconst["HK5", False]*rateconst["HK6", 
                 False]*rateconst["HK7", False]*rateconst["HK8", False]*
                rateconst["HK9", False]*rateconst["Sink_23dpg[c]", False]*
                rateconst["Sink_adp[c]", False]*rateconst["Sink_atp[c]", 
                 False]*rateconst["Sink_g6p[c]", False]*rateconst[
                 "Sink_glc-D[c]", False]*rateconst["Sink_gthrd[c]", False]*
                rateconst["Sink_pi[c]", False]))))))/
      (-(metabolite["glc-D", "c"]*rateconst["HK6", True]*
         rateconst["HK7", True]*(rateconst["HK1", False] + 
          metabolite["atp", "c"]*rateconst["HK8", True])*
         rateconst["HK9", False]*rateconst["HK9", True]*
         (rateconst["HK10", True] + rateconst["HK11", True] + 
          (rateconst["HK1", True]*rateconst["HK10", True]*rateconst["HK11", 
             True]*rateconst["HK12", True]*rateconst["HK2", True]*
            rateconst["HK3", True]*rateconst["HK4", True]*rateconst["HK5", 
             True]*rateconst["HK6", True]*rateconst["HK7", True]*
            rateconst["HK8", True]*rateconst["HK9", True]*
            rateconst["Sink_23dpg[c]", True]*rateconst["Sink_adp[c]", True]*
            rateconst["Sink_atp[c]", True]*rateconst["Sink_g6p[c]", True]*
            rateconst["Sink_glc-D[c]", True]*rateconst["Sink_gthrd[c]", True]*
            rateconst["Sink_pi[c]", True])/(250*rateconst["HK1", False]*
            rateconst["HK10", False]*rateconst["HK11", False]*
            rateconst["HK2", False]*rateconst["HK3", False]*
            rateconst["HK4", False]*rateconst["HK5", False]*
            rateconst["HK6", False]*rateconst["HK7", False]*
            rateconst["HK8", False]*rateconst["HK9", False]*
            rateconst["Sink_23dpg[c]", False]*rateconst["Sink_adp[c]", False]*
            rateconst["Sink_atp[c]", False]*rateconst["Sink_g6p[c]", False]*
            rateconst["Sink_glc-D[c]", False]*rateconst["Sink_gthrd[c]", 
             False]*rateconst["Sink_pi[c]", False]))) + 
       (rateconst["HK2", False] + metabolite["glc-D", "c"]*
          rateconst["HK9", True])*(-(metabolite["atp", "c"]*
           rateconst["HK6", True]*rateconst["HK7", True]*rateconst["HK8", 
            False]*rateconst["HK8", True]*(rateconst["HK10", True] + 
            rateconst["HK11", True] + (rateconst["HK1", True]*
              rateconst["HK10", True]*rateconst["HK11", True]*
              rateconst["HK12", True]*rateconst["HK2", True]*
              rateconst["HK3", True]*rateconst["HK4", True]*rateconst["HK5", 
               True]*rateconst["HK6", True]*rateconst["HK7", True]*
              rateconst["HK8", True]*rateconst["HK9", True]*
              rateconst["Sink_23dpg[c]", True]*rateconst["Sink_adp[c]", True]*
              rateconst["Sink_atp[c]", True]*rateconst["Sink_g6p[c]", True]*
              rateconst["Sink_glc-D[c]", True]*rateconst["Sink_gthrd[c]", 
               True]*rateconst["Sink_pi[c]", True])/(250*rateconst["HK1", 
               False]*rateconst["HK10", False]*rateconst["HK11", False]*
              rateconst["HK2", False]*rateconst["HK3", False]*
              rateconst["HK4", False]*rateconst["HK5", False]*
              rateconst["HK6", False]*rateconst["HK7", False]*
              rateconst["HK8", False]*rateconst["HK9", False]*
              rateconst["Sink_23dpg[c]", False]*rateconst["Sink_adp[c]", 
               False]*rateconst["Sink_atp[c]", False]*rateconst[
               "Sink_g6p[c]", False]*rateconst["Sink_glc-D[c]", False]*
              rateconst["Sink_gthrd[c]", False]*rateconst["Sink_pi[c]", 
               False]))) + (rateconst["HK1", False] + metabolite["atp", "c"]*
            rateconst["HK8", True])*(-(rateconst["HK1", True]*
              rateconst["HK10", True]*rateconst["HK11", True]*
              rateconst["HK12", True]^2*rateconst["HK2", True]*
              rateconst["HK3", True]*rateconst["HK4", True]*rateconst["HK5", 
               True]*rateconst["HK6", True]^2*rateconst["HK7", True]^2*
              rateconst["HK8", True]*rateconst["HK9", True]*
              rateconst["Sink_23dpg[c]", True]*rateconst["Sink_adp[c]", True]*
              rateconst["Sink_atp[c]", True]*rateconst["Sink_g6p[c]", True]*
              rateconst["Sink_glc-D[c]", True]*rateconst["Sink_gthrd[c]", 
               True]*rateconst["Sink_pi[c]", True])/
            (250*rateconst["HK1", False]*rateconst["HK10", False]*
             rateconst["HK11", False]*rateconst["HK2", False]*
             rateconst["HK3", False]*rateconst["HK4", False]*
             rateconst["HK5", False]*rateconst["HK6", False]*
             rateconst["HK7", False]*rateconst["HK8", False]*
             rateconst["HK9", False]*rateconst["Sink_23dpg[c]", False]*
             rateconst["Sink_adp[c]", False]*rateconst["Sink_atp[c]", False]*
             rateconst["Sink_g6p[c]", False]*rateconst["Sink_glc-D[c]", 
              False]*rateconst["Sink_gthrd[c]", False]*rateconst[
              "Sink_pi[c]", False]) + rateconst["HK6", True]*
            rateconst["HK7", True]*(rateconst["HK12", True] + 
             rateconst["HK8", False] + rateconst["HK9", False])*
            (rateconst["HK10", True] + rateconst["HK11", True] + 
             (rateconst["HK1", True]*rateconst["HK10", True]*rateconst[
                "HK11", True]*rateconst["HK12", True]*rateconst["HK2", True]*
               rateconst["HK3", True]*rateconst["HK4", True]*rateconst["HK5", 
                True]*rateconst["HK6", True]*rateconst["HK7", True]*rateconst[
                "HK8", True]*rateconst["HK9", True]*rateconst[
                "Sink_23dpg[c]", True]*rateconst["Sink_adp[c]", True]*
               rateconst["Sink_atp[c]", True]*rateconst["Sink_g6p[c]", True]*
               rateconst["Sink_glc-D[c]", True]*rateconst["Sink_gthrd[c]", 
                True]*rateconst["Sink_pi[c]", True])/(250*rateconst["HK1", 
                False]*rateconst["HK10", False]*rateconst["HK11", False]*
               rateconst["HK2", False]*rateconst["HK3", False]*rateconst[
                "HK4", False]*rateconst["HK5", False]*rateconst["HK6", False]*
               rateconst["HK7", False]*rateconst["HK8", False]*rateconst[
                "HK9", False]*rateconst["Sink_23dpg[c]", False]*rateconst[
                "Sink_adp[c]", False]*rateconst["Sink_atp[c]", False]*
               rateconst["Sink_g6p[c]", False]*rateconst["Sink_glc-D[c]", 
                False]*rateconst["Sink_gthrd[c]", False]*rateconst[
                "Sink_pi[c]", False])))))))/(250*rateconst["HK1", False]*
    rateconst["HK10", False]*rateconst["HK11", False]*rateconst["HK2", False]*
    rateconst["HK6", False]*rateconst["HK7", False]*rateconst["HK8", False]*
    rateconst["HK9", False]*rateconst["Sink_23dpg[c]", False]*
    rateconst["Sink_adp[c]", False]*rateconst["Sink_atp[c]", False]*
    rateconst["Sink_g6p[c]", False]*rateconst["Sink_glc-D[c]", False]*
    rateconst["Sink_gthrd[c]", False]*rateconst["Sink_pi[c]", False]*
    (-((rateconst["HK3", False]*rateconst["HK4", False]*
         rateconst["HK5", False]*(rateconst["HK1", False] + 
          metabolite["atp", "c"]*rateconst["HK8", True])*
         rateconst["HK9", False]*(metabolite["glc-D", "c"]*
           (-(rateconst["HK11", True]*rateconst["HK6", True]) + 
            rateconst["HK11", True]*rateconst["HK7", True] + 
            rateconst["HK6", True]*rateconst["HK7", True])*
           rateconst["HK9", True] + (rateconst["HK1", True]*
            rateconst["HK10", True]*rateconst["HK11", True]*
            rateconst["HK12", True]*rateconst["HK2", True]*rateconst["HK3", 
             True]*rateconst["HK4", True]*rateconst["HK5", True]*
            rateconst["HK6", True]^2*(rateconst["HK2", False] - 
             rateconst["HK7", True])*rateconst["HK7", True]*
            rateconst["HK8", True]*rateconst["HK9", True]*
            rateconst["Sink_23dpg[c]", True]*rateconst["Sink_adp[c]", True]*
            rateconst["Sink_atp[c]", True]*rateconst["Sink_g6p[c]", True]*
            rateconst["Sink_glc-D[c]", True]*rateconst["Sink_gthrd[c]", True]*
            rateconst["Sink_pi[c]", True])/(250*rateconst["HK1", False]*
            rateconst["HK10", False]*rateconst["HK11", False]*
            rateconst["HK2", False]*rateconst["HK3", False]*
            rateconst["HK4", False]*rateconst["HK5", False]*
            rateconst["HK6", False]*rateconst["HK7", False]*
            rateconst["HK8", False]*rateconst["HK9", False]*
            rateconst["Sink_23dpg[c]", False]*rateconst["Sink_adp[c]", False]*
            rateconst["Sink_atp[c]", False]*rateconst["Sink_g6p[c]", False]*
            rateconst["Sink_glc-D[c]", False]*rateconst["Sink_gthrd[c]", 
             False]*rateconst["Sink_pi[c]", False])) - 
        (rateconst["HK2", False] + metabolite["glc-D", "c"]*
           rateconst["HK9", True])*(rateconst["HK3", False]*
           rateconst["HK4", False]*rateconst["HK5", False]*
           (rateconst["HK1", False] + metabolite["atp", "c"]*
             rateconst["HK8", True])*((rateconst["HK6", True]*rateconst[
                "HK7", True] + rateconst["HK11", True]*(-rateconst["HK6", 
                  True] + rateconst["HK7", True]))*(rateconst["HK12", True] + 
              rateconst["HK8", False] + rateconst["HK9", False]) + 
            (rateconst["HK1", True]*rateconst["HK10", True]*rateconst["HK11", 
               True]*rateconst["HK12", True]*rateconst["HK2", True]*
              rateconst["HK3", True]*rateconst["HK4", True]*rateconst["HK5", 
               True]*rateconst["HK6", True]^2*rateconst["HK7", True]^2*
              rateconst["HK8", True]*rateconst["HK9", True]*
              rateconst["Sink_23dpg[c]", True]*rateconst["Sink_adp[c]", True]*
              rateconst["Sink_atp[c]", True]*rateconst["Sink_g6p[c]", True]*
              rateconst["Sink_glc-D[c]", True]*rateconst["Sink_gthrd[c]", 
               True]*rateconst["Sink_pi[c]", True])/(250*rateconst["HK1", 
               False]*rateconst["HK10", False]*rateconst["HK11", False]*
              rateconst["HK2", False]*rateconst["HK3", False]*
              rateconst["HK4", False]*rateconst["HK5", False]*
              rateconst["HK6", False]*rateconst["HK7", False]*
              rateconst["HK8", False]*rateconst["HK9", False]*
              rateconst["Sink_23dpg[c]", False]*rateconst["Sink_adp[c]", 
               False]*rateconst["Sink_atp[c]", False]*rateconst[
               "Sink_g6p[c]", False]*rateconst["Sink_glc-D[c]", False]*
              rateconst["Sink_gthrd[c]", False]*rateconst["Sink_pi[c]", 
               False])) + rateconst["HK8", False]*
           (-(metabolite["atp", "c"]*rateconst["HK3", False]*
              rateconst["HK4", False]*rateconst["HK5", False]*
              (rateconst["HK6", True]*rateconst["HK7", True] + rateconst[
                 "HK11", True]*(-rateconst["HK6", True] + rateconst["HK7", 
                  True]))*rateconst["HK8", True]) - 
            (rateconst["HK1", True]*rateconst["HK10", True]*rateconst["HK11", 
               True]*rateconst["HK12", True]*rateconst["HK2", True]*
              rateconst["HK3", True]*rateconst["HK4", True]*rateconst["HK5", 
               True]*rateconst["HK6", True]^2*rateconst["HK7", True]*
              (rateconst["HK1", False]*rateconst["HK3", False]*rateconst[
                 "HK4", False]*rateconst["HK5", False] - (metabolite["gthrd", 
                   "c"]*rateconst["HK3", True]*rateconst["HK4", False]*
                  rateconst["HK5", False] + rateconst["HK3", False]*
                  (rateconst["HK4", False]*rateconst["HK5", False] + 
                   metabolite["23dpg", "c"]*rateconst["HK4", True]*rateconst[
                     "HK5", False] + metabolite["pi", "c"]*rateconst["HK4", 
                     False]*rateconst["HK5", True]))*rateconst["HK7", True])*
              rateconst["HK8", True]*rateconst["HK9", True]*
              rateconst["Sink_23dpg[c]", True]*rateconst["Sink_adp[c]", True]*
              rateconst["Sink_atp[c]", True]*rateconst["Sink_g6p[c]", True]*
              rateconst["Sink_glc-D[c]", True]*rateconst["Sink_gthrd[c]", 
               True]*rateconst["Sink_pi[c]", True])/(250*rateconst["HK1", 
               False]*rateconst["HK10", False]*rateconst["HK11", False]*
              rateconst["HK2", False]*rateconst["HK3", False]*
              rateconst["HK4", False]*rateconst["HK5", False]*
              rateconst["HK6", False]*rateconst["HK7", False]*
              rateconst["HK8", False]*rateconst["HK9", False]*
              rateconst["Sink_23dpg[c]", False]*rateconst["Sink_adp[c]", 
               False]*rateconst["Sink_atp[c]", False]*rateconst[
               "Sink_g6p[c]", False]*rateconst["Sink_glc-D[c]", False]*
              rateconst["Sink_gthrd[c]", False]*rateconst["Sink_pi[c]", 
               False]))))*(metabolite["atp", "c"]*metabolite["glc-D", "c"]*
         rateconst["HK1", True]*rateconst["HK6", True]*rateconst["HK7", True]*
         rateconst["HK8", True]*rateconst["HK9", False]*
         (rateconst["HK10", True] + rateconst["HK11", True] + 
          (rateconst["HK1", True]*rateconst["HK10", True]*rateconst["HK11", 
             True]*rateconst["HK12", True]*rateconst["HK2", True]*
            rateconst["HK3", True]*rateconst["HK4", True]*rateconst["HK5", 
             True]*rateconst["HK6", True]*rateconst["HK7", True]*
            rateconst["HK8", True]*rateconst["HK9", True]*
            rateconst["Sink_23dpg[c]", True]*rateconst["Sink_adp[c]", True]*
            rateconst["Sink_atp[c]", True]*rateconst["Sink_g6p[c]", True]*
            rateconst["Sink_glc-D[c]", True]*rateconst["Sink_gthrd[c]", True]*
            rateconst["Sink_pi[c]", True])/(250*rateconst["HK1", False]*
            rateconst["HK10", False]*rateconst["HK11", False]*
            rateconst["HK2", False]*rateconst["HK3", False]*
            rateconst["HK4", False]*rateconst["HK5", False]*
            rateconst["HK6", False]*rateconst["HK7", False]*
            rateconst["HK8", False]*rateconst["HK9", False]*
            rateconst["Sink_23dpg[c]", False]*rateconst["Sink_adp[c]", False]*
            rateconst["Sink_atp[c]", False]*rateconst["Sink_g6p[c]", False]*
            rateconst["Sink_glc-D[c]", False]*rateconst["Sink_gthrd[c]", 
             False]*rateconst["Sink_pi[c]", False])) + metabolite["atp", "c"]*
         rateconst["HK2", True]*(-(metabolite["atp", "c"]*rateconst["HK6", 
             True]*rateconst["HK7", True]*rateconst["HK8", False]*
            rateconst["HK8", True]*(rateconst["HK10", True] + 
             rateconst["HK11", True] + (rateconst["HK1", True]*rateconst[
                "HK10", True]*rateconst["HK11", True]*rateconst["HK12", True]*
               rateconst["HK2", True]*rateconst["HK3", True]*rateconst["HK4", 
                True]*rateconst["HK5", True]*rateconst["HK6", True]*rateconst[
                "HK7", True]*rateconst["HK8", True]*rateconst["HK9", True]*
               rateconst["Sink_23dpg[c]", True]*rateconst["Sink_adp[c]", 
                True]*rateconst["Sink_atp[c]", True]*rateconst["Sink_g6p[c]", 
                True]*rateconst["Sink_glc-D[c]", True]*rateconst[
                "Sink_gthrd[c]", True]*rateconst["Sink_pi[c]", True])/
              (250*rateconst["HK1", False]*rateconst["HK10", False]*rateconst[
                "HK11", False]*rateconst["HK2", False]*rateconst["HK3", 
                False]*rateconst["HK4", False]*rateconst["HK5", False]*
               rateconst["HK6", False]*rateconst["HK7", False]*rateconst[
                "HK8", False]*rateconst["HK9", False]*rateconst[
                "Sink_23dpg[c]", False]*rateconst["Sink_adp[c]", False]*
               rateconst["Sink_atp[c]", False]*rateconst["Sink_g6p[c]", 
                False]*rateconst["Sink_glc-D[c]", False]*rateconst[
                "Sink_gthrd[c]", False]*rateconst["Sink_pi[c]", False]))) + 
          (rateconst["HK1", False] + metabolite["atp", "c"]*rateconst["HK8", 
              True])*(-(rateconst["HK1", True]*rateconst["HK10", True]*
               rateconst["HK11", True]*rateconst["HK12", True]^2*rateconst[
                "HK2", True]*rateconst["HK3", True]*rateconst["HK4", True]*
               rateconst["HK5", True]*rateconst["HK6", True]^2*rateconst[
                 "HK7", True]^2*rateconst["HK8", True]*rateconst["HK9", True]*
               rateconst["Sink_23dpg[c]", True]*rateconst["Sink_adp[c]", 
                True]*rateconst["Sink_atp[c]", True]*rateconst["Sink_g6p[c]", 
                True]*rateconst["Sink_glc-D[c]", True]*rateconst[
                "Sink_gthrd[c]", True]*rateconst["Sink_pi[c]", True])/
             (250*rateconst["HK1", False]*rateconst["HK10", False]*
              rateconst["HK11", False]*rateconst["HK2", False]*
              rateconst["HK3", False]*rateconst["HK4", False]*
              rateconst["HK5", False]*rateconst["HK6", False]*
              rateconst["HK7", False]*rateconst["HK8", False]*
              rateconst["HK9", False]*rateconst["Sink_23dpg[c]", False]*
              rateconst["Sink_adp[c]", False]*rateconst["Sink_atp[c]", False]*
              rateconst["Sink_g6p[c]", False]*rateconst["Sink_glc-D[c]", 
               False]*rateconst["Sink_gthrd[c]", False]*rateconst[
               "Sink_pi[c]", False]) + rateconst["HK6", True]*
             rateconst["HK7", True]*(rateconst["HK12", True] + 
              rateconst["HK8", False] + rateconst["HK9", False])*
             (rateconst["HK10", True] + rateconst["HK11", True] + 
              (rateconst["HK1", True]*rateconst["HK10", True]*rateconst[
                 "HK11", True]*rateconst["HK12", True]*rateconst["HK2", True]*
                rateconst["HK3", True]*rateconst["HK4", True]*rateconst[
                 "HK5", True]*rateconst["HK6", True]*rateconst["HK7", True]*
                rateconst["HK8", True]*rateconst["HK9", True]*rateconst[
                 "Sink_23dpg[c]", True]*rateconst["Sink_adp[c]", True]*
                rateconst["Sink_atp[c]", True]*rateconst["Sink_g6p[c]", True]*
                rateconst["Sink_glc-D[c]", True]*rateconst["Sink_gthrd[c]", 
                 True]*rateconst["Sink_pi[c]", True])/(250*rateconst["HK1", 
                 False]*rateconst["HK10", False]*rateconst["HK11", False]*
                rateconst["HK2", False]*rateconst["HK3", False]*rateconst[
                 "HK4", False]*rateconst["HK5", False]*rateconst["HK6", 
                 False]*rateconst["HK7", False]*rateconst["HK8", False]*
                rateconst["HK9", False]*rateconst["Sink_23dpg[c]", False]*
                rateconst["Sink_adp[c]", False]*rateconst["Sink_atp[c]", 
                 False]*rateconst["Sink_g6p[c]", False]*rateconst[
                 "Sink_glc-D[c]", False]*rateconst["Sink_gthrd[c]", False]*
                rateconst["Sink_pi[c]", False])))))) + 
     (-(rateconst["HK9", False]*((rateconst["HK1", True]*rateconst["HK10", 
             True]*rateconst["HK11", True]*rateconst["HK12", True]*
            rateconst["HK2", True]*rateconst["HK3", True]*rateconst["HK4", 
             True]*rateconst["HK5", True]*rateconst["HK6", True]^2*
            rateconst["HK7", True]*(metabolite["glc-D", "c"]*
              rateconst["HK1", True] + metabolite["atp", "c"]*
              rateconst["HK2", True] + rateconst["HK7", True])*
            rateconst["HK8", True]*(rateconst["HK1", False] + 
             metabolite["atp", "c"]*rateconst["HK8", True])*
            rateconst["HK9", True]*rateconst["Sink_23dpg[c]", True]*
            rateconst["Sink_adp[c]", True]*rateconst["Sink_atp[c]", True]*
            rateconst["Sink_g6p[c]", True]*rateconst["Sink_glc-D[c]", True]*
            rateconst["Sink_gthrd[c]", True]*rateconst["Sink_pi[c]", True])/
           (250*rateconst["HK1", False]*rateconst["HK10", False]*
            rateconst["HK11", False]*rateconst["HK2", False]*
            rateconst["HK6", False]*rateconst["HK7", False]*
            rateconst["HK8", False]*rateconst["HK9", False]*
            rateconst["Sink_23dpg[c]", False]*rateconst["Sink_adp[c]", False]*
            rateconst["Sink_atp[c]", False]*rateconst["Sink_g6p[c]", False]*
            rateconst["Sink_glc-D[c]", False]*rateconst["Sink_gthrd[c]", 
             False]*rateconst["Sink_pi[c]", False]) + 
          metabolite["glc-D", "c"]*rateconst["HK1", True]*
           (-(metabolite["atp", "c"]*rateconst["HK3", False]*
              rateconst["HK4", False]*rateconst["HK5", False]*
              (rateconst["HK6", True]*rateconst["HK7", True] + rateconst[
                 "HK11", True]*(-rateconst["HK6", True] + rateconst["HK7", 
                  True]))*rateconst["HK8", True]) - 
            (rateconst["HK1", True]*rateconst["HK10", True]*rateconst["HK11", 
               True]*rateconst["HK12", True]*rateconst["HK2", True]*
              rateconst["HK3", True]*rateconst["HK4", True]*rateconst["HK5", 
               True]*rateconst["HK6", True]^2*rateconst["HK7", True]*
              (rateconst["HK1", False]*rateconst["HK3", False]*rateconst[
                 "HK4", False]*rateconst["HK5", False] - (metabolite["gthrd", 
                   "c"]*rateconst["HK3", True]*rateconst["HK4", False]*
                  rateconst["HK5", False] + rateconst["HK3", False]*
                  (rateconst["HK4", False]*rateconst["HK5", False] + 
                   metabolite["23dpg", "c"]*rateconst["HK4", True]*rateconst[
                     "HK5", False] + metabolite["pi", "c"]*rateconst["HK4", 
                     False]*rateconst["HK5", True]))*rateconst["HK7", True])*
              rateconst["HK8", True]*rateconst["HK9", True]*
              rateconst["Sink_23dpg[c]", True]*rateconst["Sink_adp[c]", True]*
              rateconst["Sink_atp[c]", True]*rateconst["Sink_g6p[c]", True]*
              rateconst["Sink_glc-D[c]", True]*rateconst["Sink_gthrd[c]", 
               True]*rateconst["Sink_pi[c]", True])/(250*rateconst["HK1", 
               False]*rateconst["HK10", False]*rateconst["HK11", False]*
              rateconst["HK2", False]*rateconst["HK3", False]*
              rateconst["HK4", False]*rateconst["HK5", False]*
              rateconst["HK6", False]*rateconst["HK7", False]*
              rateconst["HK8", False]*rateconst["HK9", False]*
              rateconst["Sink_23dpg[c]", False]*rateconst["Sink_adp[c]", 
               False]*rateconst["Sink_atp[c]", False]*rateconst[
               "Sink_g6p[c]", False]*rateconst["Sink_glc-D[c]", False]*
              rateconst["Sink_gthrd[c]", False]*rateconst["Sink_pi[c]", 
               False])))) + metabolite["atp", "c"]*rateconst["HK2", True]*
        (rateconst["HK3", False]*rateconst["HK4", False]*
          rateconst["HK5", False]*(rateconst["HK1", False] + 
           metabolite["atp", "c"]*rateconst["HK8", True])*
          ((rateconst["HK6", True]*rateconst["HK7", True] + 
             rateconst["HK11", True]*(-rateconst["HK6", True] + rateconst[
                "HK7", True]))*(rateconst["HK12", True] + rateconst["HK8", 
              False] + rateconst["HK9", False]) + (rateconst["HK1", True]*
             rateconst["HK10", True]*rateconst["HK11", True]*
             rateconst["HK12", True]*rateconst["HK2", True]*rateconst["HK3", 
              True]*rateconst["HK4", True]*rateconst["HK5", True]*
             rateconst["HK6", True]^2*rateconst["HK7", True]^2*
             rateconst["HK8", True]*rateconst["HK9", True]*
             rateconst["Sink_23dpg[c]", True]*rateconst["Sink_adp[c]", True]*
             rateconst["Sink_atp[c]", True]*rateconst["Sink_g6p[c]", True]*
             rateconst["Sink_glc-D[c]", True]*rateconst["Sink_gthrd[c]", 
              True]*rateconst["Sink_pi[c]", True])/(250*rateconst["HK1", 
              False]*rateconst["HK10", False]*rateconst["HK11", False]*
             rateconst["HK2", False]*rateconst["HK3", False]*
             rateconst["HK4", False]*rateconst["HK5", False]*
             rateconst["HK6", False]*rateconst["HK7", False]*
             rateconst["HK8", False]*rateconst["HK9", False]*
             rateconst["Sink_23dpg[c]", False]*rateconst["Sink_adp[c]", 
              False]*rateconst["Sink_atp[c]", False]*rateconst["Sink_g6p[c]", 
              False]*rateconst["Sink_glc-D[c]", False]*rateconst[
              "Sink_gthrd[c]", False]*rateconst["Sink_pi[c]", False])) + 
         rateconst["HK8", False]*(-(metabolite["atp", "c"]*rateconst["HK3", 
              False]*rateconst["HK4", False]*rateconst["HK5", False]*
             (rateconst["HK6", True]*rateconst["HK7", True] + 
              rateconst["HK11", True]*(-rateconst["HK6", True] + 
                rateconst["HK7", True]))*rateconst["HK8", True]) - 
           (rateconst["HK1", True]*rateconst["HK10", True]*rateconst["HK11", 
              True]*rateconst["HK12", True]*rateconst["HK2", True]*
             rateconst["HK3", True]*rateconst["HK4", True]*rateconst["HK5", 
              True]*rateconst["HK6", True]^2*rateconst["HK7", True]*
             (rateconst["HK1", False]*rateconst["HK3", False]*rateconst[
                "HK4", False]*rateconst["HK5", False] - 
              (metabolite["gthrd", "c"]*rateconst["HK3", True]*rateconst[
                  "HK4", False]*rateconst["HK5", False] + rateconst["HK3", 
                  False]*(rateconst["HK4", False]*rateconst["HK5", False] + 
                  metabolite["23dpg", "c"]*rateconst["HK4", True]*rateconst[
                    "HK5", False] + metabolite["pi", "c"]*rateconst["HK4", 
                    False]*rateconst["HK5", True]))*rateconst["HK7", True])*
             rateconst["HK8", True]*rateconst["HK9", True]*
             rateconst["Sink_23dpg[c]", True]*rateconst["Sink_adp[c]", True]*
             rateconst["Sink_atp[c]", True]*rateconst["Sink_g6p[c]", True]*
             rateconst["Sink_glc-D[c]", True]*rateconst["Sink_gthrd[c]", 
              True]*rateconst["Sink_pi[c]", True])/(250*rateconst["HK1", 
              False]*rateconst["HK10", False]*rateconst["HK11", False]*
             rateconst["HK2", False]*rateconst["HK3", False]*
             rateconst["HK4", False]*rateconst["HK5", False]*
             rateconst["HK6", False]*rateconst["HK7", False]*
             rateconst["HK8", False]*rateconst["HK9", False]*
             rateconst["Sink_23dpg[c]", False]*rateconst["Sink_adp[c]", 
              False]*rateconst["Sink_atp[c]", False]*rateconst["Sink_g6p[c]", 
              False]*rateconst["Sink_glc-D[c]", False]*rateconst[
              "Sink_gthrd[c]", False]*rateconst["Sink_pi[c]", False]))))*
      (metabolite["glc-D", "c"]*rateconst["HK6", True]*rateconst["HK7", True]*
        (rateconst["HK1", False] + metabolite["atp", "c"]*
          rateconst["HK8", True])*rateconst["HK9", False]*
        rateconst["HK9", True]*(rateconst["HK10", True] + 
         rateconst["HK11", True] + (rateconst["HK1", True]*
           rateconst["HK10", True]*rateconst["HK11", True]*
           rateconst["HK12", True]*rateconst["HK2", True]*rateconst["HK3", 
            True]*rateconst["HK4", True]*rateconst["HK5", True]*
           rateconst["HK6", True]*rateconst["HK7", True]*rateconst["HK8", 
            True]*rateconst["HK9", True]*rateconst["Sink_23dpg[c]", True]*
           rateconst["Sink_adp[c]", True]*rateconst["Sink_atp[c]", True]*
           rateconst["Sink_g6p[c]", True]*rateconst["Sink_glc-D[c]", True]*
           rateconst["Sink_gthrd[c]", True]*rateconst["Sink_pi[c]", True])/
          (250*rateconst["HK1", False]*rateconst["HK10", False]*
           rateconst["HK11", False]*rateconst["HK2", False]*
           rateconst["HK3", False]*rateconst["HK4", False]*
           rateconst["HK5", False]*rateconst["HK6", False]*
           rateconst["HK7", False]*rateconst["HK8", False]*
           rateconst["HK9", False]*rateconst["Sink_23dpg[c]", False]*
           rateconst["Sink_adp[c]", False]*rateconst["Sink_atp[c]", False]*
           rateconst["Sink_g6p[c]", False]*rateconst["Sink_glc-D[c]", False]*
           rateconst["Sink_gthrd[c]", False]*rateconst["Sink_pi[c]", 
            False])) - (rateconst["HK2", False] + metabolite["glc-D", "c"]*
          rateconst["HK9", True])*(-(metabolite["atp", "c"]*
           rateconst["HK6", True]*rateconst["HK7", True]*rateconst["HK8", 
            False]*rateconst["HK8", True]*(rateconst["HK10", True] + 
            rateconst["HK11", True] + (rateconst["HK1", True]*
              rateconst["HK10", True]*rateconst["HK11", True]*
              rateconst["HK12", True]*rateconst["HK2", True]*
              rateconst["HK3", True]*rateconst["HK4", True]*rateconst["HK5", 
               True]*rateconst["HK6", True]*rateconst["HK7", True]*
              rateconst["HK8", True]*rateconst["HK9", True]*
              rateconst["Sink_23dpg[c]", True]*rateconst["Sink_adp[c]", True]*
              rateconst["Sink_atp[c]", True]*rateconst["Sink_g6p[c]", True]*
              rateconst["Sink_glc-D[c]", True]*rateconst["Sink_gthrd[c]", 
               True]*rateconst["Sink_pi[c]", True])/(250*rateconst["HK1", 
               False]*rateconst["HK10", False]*rateconst["HK11", False]*
              rateconst["HK2", False]*rateconst["HK3", False]*
              rateconst["HK4", False]*rateconst["HK5", False]*
              rateconst["HK6", False]*rateconst["HK7", False]*
              rateconst["HK8", False]*rateconst["HK9", False]*
              rateconst["Sink_23dpg[c]", False]*rateconst["Sink_adp[c]", 
               False]*rateconst["Sink_atp[c]", False]*rateconst[
               "Sink_g6p[c]", False]*rateconst["Sink_glc-D[c]", False]*
              rateconst["Sink_gthrd[c]", False]*rateconst["Sink_pi[c]", 
               False]))) + (rateconst["HK1", False] + metabolite["atp", "c"]*
            rateconst["HK8", True])*(-(rateconst["HK1", True]*
              rateconst["HK10", True]*rateconst["HK11", True]*
              rateconst["HK12", True]^2*rateconst["HK2", True]*
              rateconst["HK3", True]*rateconst["HK4", True]*rateconst["HK5", 
               True]*rateconst["HK6", True]^2*rateconst["HK7", True]^2*
              rateconst["HK8", True]*rateconst["HK9", True]*
              rateconst["Sink_23dpg[c]", True]*rateconst["Sink_adp[c]", True]*
              rateconst["Sink_atp[c]", True]*rateconst["Sink_g6p[c]", True]*
              rateconst["Sink_glc-D[c]", True]*rateconst["Sink_gthrd[c]", 
               True]*rateconst["Sink_pi[c]", True])/
            (250*rateconst["HK1", False]*rateconst["HK10", False]*
             rateconst["HK11", False]*rateconst["HK2", False]*
             rateconst["HK3", False]*rateconst["HK4", False]*
             rateconst["HK5", False]*rateconst["HK6", False]*
             rateconst["HK7", False]*rateconst["HK8", False]*
             rateconst["HK9", False]*rateconst["Sink_23dpg[c]", False]*
             rateconst["Sink_adp[c]", False]*rateconst["Sink_atp[c]", False]*
             rateconst["Sink_g6p[c]", False]*rateconst["Sink_glc-D[c]", 
              False]*rateconst["Sink_gthrd[c]", False]*rateconst[
              "Sink_pi[c]", False]) + rateconst["HK6", True]*
            rateconst["HK7", True]*(rateconst["HK12", True] + 
             rateconst["HK8", False] + rateconst["HK9", False])*
            (rateconst["HK10", True] + rateconst["HK11", True] + 
             (rateconst["HK1", True]*rateconst["HK10", True]*rateconst[
                "HK11", True]*rateconst["HK12", True]*rateconst["HK2", True]*
               rateconst["HK3", True]*rateconst["HK4", True]*rateconst["HK5", 
                True]*rateconst["HK6", True]*rateconst["HK7", True]*rateconst[
                "HK8", True]*rateconst["HK9", True]*rateconst[
                "Sink_23dpg[c]", True]*rateconst["Sink_adp[c]", True]*
               rateconst["Sink_atp[c]", True]*rateconst["Sink_g6p[c]", True]*
               rateconst["Sink_glc-D[c]", True]*rateconst["Sink_gthrd[c]", 
                True]*rateconst["Sink_pi[c]", True])/(250*rateconst["HK1", 
                False]*rateconst["HK10", False]*rateconst["HK11", False]*
               rateconst["HK2", False]*rateconst["HK3", False]*rateconst[
                "HK4", False]*rateconst["HK5", False]*rateconst["HK6", False]*
               rateconst["HK7", False]*rateconst["HK8", False]*rateconst[
                "HK9", False]*rateconst["Sink_23dpg[c]", False]*rateconst[
                "Sink_adp[c]", False]*rateconst["Sink_atp[c]", False]*
               rateconst["Sink_g6p[c]", False]*rateconst["Sink_glc-D[c]", 
                False]*rateconst["Sink_gthrd[c]", False]*rateconst[
                "Sink_pi[c]", False]))))))) - 
  (parameter["HKtot"]*rateconst["HK3", False]*rateconst["HK4", False]*
    rateconst["HK5", False]*rateconst["HK6", True]*rateconst["HK7", True]*
    (metabolite["glc-D", "c"]*rateconst["HK6", True]*rateconst["HK7", True]*
      (rateconst["HK1", False] + metabolite["atp", "c"]*
        rateconst["HK8", True])*rateconst["HK9", False]*
      rateconst["HK9", True]*(rateconst["HK10", True] + 
       rateconst["HK11", True] + (rateconst["HK1", True]*
         rateconst["HK10", True]*rateconst["HK11", True]*
         rateconst["HK12", True]*rateconst["HK2", True]*
         rateconst["HK3", True]*rateconst["HK4", True]*rateconst["HK5", True]*
         rateconst["HK6", True]*rateconst["HK7", True]*rateconst["HK8", True]*
         rateconst["HK9", True]*rateconst["Sink_23dpg[c]", True]*
         rateconst["Sink_adp[c]", True]*rateconst["Sink_atp[c]", True]*
         rateconst["Sink_g6p[c]", True]*rateconst["Sink_glc-D[c]", True]*
         rateconst["Sink_gthrd[c]", True]*rateconst["Sink_pi[c]", True])/
        (250*rateconst["HK1", False]*rateconst["HK10", False]*
         rateconst["HK11", False]*rateconst["HK2", False]*
         rateconst["HK3", False]*rateconst["HK4", False]*
         rateconst["HK5", False]*rateconst["HK6", False]*
         rateconst["HK7", False]*rateconst["HK8", False]*
         rateconst["HK9", False]*rateconst["Sink_23dpg[c]", False]*
         rateconst["Sink_adp[c]", False]*rateconst["Sink_atp[c]", False]*
         rateconst["Sink_g6p[c]", False]*rateconst["Sink_glc-D[c]", False]*
         rateconst["Sink_gthrd[c]", False]*rateconst["Sink_pi[c]", False])) - 
     (rateconst["HK2", False] + metabolite["glc-D", "c"]*
        rateconst["HK9", True])*(-(metabolite["atp", "c"]*
         rateconst["HK6", True]*rateconst["HK7", True]*rateconst["HK8", 
          False]*rateconst["HK8", True]*(rateconst["HK10", True] + 
          rateconst["HK11", True] + (rateconst["HK1", True]*
            rateconst["HK10", True]*rateconst["HK11", True]*
            rateconst["HK12", True]*rateconst["HK2", True]*rateconst["HK3", 
             True]*rateconst["HK4", True]*rateconst["HK5", True]*
            rateconst["HK6", True]*rateconst["HK7", True]*rateconst["HK8", 
             True]*rateconst["HK9", True]*rateconst["Sink_23dpg[c]", True]*
            rateconst["Sink_adp[c]", True]*rateconst["Sink_atp[c]", True]*
            rateconst["Sink_g6p[c]", True]*rateconst["Sink_glc-D[c]", True]*
            rateconst["Sink_gthrd[c]", True]*rateconst["Sink_pi[c]", True])/
           (250*rateconst["HK1", False]*rateconst["HK10", False]*
            rateconst["HK11", False]*rateconst["HK2", False]*
            rateconst["HK3", False]*rateconst["HK4", False]*
            rateconst["HK5", False]*rateconst["HK6", False]*
            rateconst["HK7", False]*rateconst["HK8", False]*
            rateconst["HK9", False]*rateconst["Sink_23dpg[c]", False]*
            rateconst["Sink_adp[c]", False]*rateconst["Sink_atp[c]", False]*
            rateconst["Sink_g6p[c]", False]*rateconst["Sink_glc-D[c]", False]*
            rateconst["Sink_gthrd[c]", False]*rateconst["Sink_pi[c]", 
             False]))) + (rateconst["HK1", False] + metabolite["atp", "c"]*
          rateconst["HK8", True])*
        (-(rateconst["HK1", True]*rateconst["HK10", True]*rateconst["HK11", 
             True]*rateconst["HK12", True]^2*rateconst["HK2", True]*
            rateconst["HK3", True]*rateconst["HK4", True]*rateconst["HK5", 
             True]*rateconst["HK6", True]^2*rateconst["HK7", True]^2*
            rateconst["HK8", True]*rateconst["HK9", True]*
            rateconst["Sink_23dpg[c]", True]*rateconst["Sink_adp[c]", True]*
            rateconst["Sink_atp[c]", True]*rateconst["Sink_g6p[c]", True]*
            rateconst["Sink_glc-D[c]", True]*rateconst["Sink_gthrd[c]", True]*
            rateconst["Sink_pi[c]", True])/(250*rateconst["HK1", False]*
           rateconst["HK10", False]*rateconst["HK11", False]*
           rateconst["HK2", False]*rateconst["HK3", False]*
           rateconst["HK4", False]*rateconst["HK5", False]*
           rateconst["HK6", False]*rateconst["HK7", False]*
           rateconst["HK8", False]*rateconst["HK9", False]*
           rateconst["Sink_23dpg[c]", False]*rateconst["Sink_adp[c]", False]*
           rateconst["Sink_atp[c]", False]*rateconst["Sink_g6p[c]", False]*
           rateconst["Sink_glc-D[c]", False]*rateconst["Sink_gthrd[c]", 
            False]*rateconst["Sink_pi[c]", False]) + rateconst["HK6", True]*
          rateconst["HK7", True]*(rateconst["HK12", True] + 
           rateconst["HK8", False] + rateconst["HK9", False])*
          (rateconst["HK10", True] + rateconst["HK11", True] + 
           (rateconst["HK1", True]*rateconst["HK10", True]*rateconst["HK11", 
              True]*rateconst["HK12", True]*rateconst["HK2", True]*
             rateconst["HK3", True]*rateconst["HK4", True]*rateconst["HK5", 
              True]*rateconst["HK6", True]*rateconst["HK7", True]*
             rateconst["HK8", True]*rateconst["HK9", True]*
             rateconst["Sink_23dpg[c]", True]*rateconst["Sink_adp[c]", True]*
             rateconst["Sink_atp[c]", True]*rateconst["Sink_g6p[c]", True]*
             rateconst["Sink_glc-D[c]", True]*rateconst["Sink_gthrd[c]", 
              True]*rateconst["Sink_pi[c]", True])/(250*rateconst["HK1", 
              False]*rateconst["HK10", False]*rateconst["HK11", False]*
             rateconst["HK2", False]*rateconst["HK3", False]*
             rateconst["HK4", False]*rateconst["HK5", False]*
             rateconst["HK6", False]*rateconst["HK7", False]*
             rateconst["HK8", False]*rateconst["HK9", False]*
             rateconst["Sink_23dpg[c]", False]*rateconst["Sink_adp[c]", 
              False]*rateconst["Sink_atp[c]", False]*rateconst["Sink_g6p[c]", 
              False]*rateconst["Sink_glc-D[c]", False]*rateconst[
              "Sink_gthrd[c]", False]*rateconst["Sink_pi[c]", False])))))*
    (metabolite["atp", "c"]*(rateconst["HK1", False]*rateconst["HK2", True]*
        (rateconst["HK12", True] + rateconst["HK8", False] + 
         rateconst["HK9", False]) + rateconst["HK8", True]*
        (metabolite["glc-D", "c"]*rateconst["HK1", True]*
          rateconst["HK9", False] + metabolite["atp", "c"]*
          rateconst["HK2", True]*(rateconst["HK12", True] + 
           rateconst["HK9", False]))) - 
     ((metabolite["atp", "c"]*rateconst["HK8", True]*
         (rateconst["HK2", False]*rateconst["HK9", False] + 
          rateconst["HK12", True]*(rateconst["HK2", False] + 
            metabolite["glc-D", "c"]*rateconst["HK9", True])) + 
        rateconst["HK1", False]*(rateconst["HK2", False]*
           (rateconst["HK8", False] + rateconst["HK9", False]) + 
          metabolite["glc-D", "c"]*rateconst["HK8", False]*
           rateconst["HK9", True] + rateconst["HK12", True]*
           (rateconst["HK2", False] + metabolite["glc-D", "c"]*
             rateconst["HK9", True])))*(metabolite["atp", "c"]*
         metabolite["glc-D", "c"]*rateconst["HK1", True]*
         rateconst["HK6", True]*rateconst["HK7", True]*rateconst["HK8", True]*
         rateconst["HK9", False]*(rateconst["HK10", True] + 
          rateconst["HK11", True] + (rateconst["HK1", True]*
            rateconst["HK10", True]*rateconst["HK11", True]*
            rateconst["HK12", True]*rateconst["HK2", True]*rateconst["HK3", 
             True]*rateconst["HK4", True]*rateconst["HK5", True]*
            rateconst["HK6", True]*rateconst["HK7", True]*rateconst["HK8", 
             True]*rateconst["HK9", True]*rateconst["Sink_23dpg[c]", True]*
            rateconst["Sink_adp[c]", True]*rateconst["Sink_atp[c]", True]*
            rateconst["Sink_g6p[c]", True]*rateconst["Sink_glc-D[c]", True]*
            rateconst["Sink_gthrd[c]", True]*rateconst["Sink_pi[c]", True])/
           (250*rateconst["HK1", False]*rateconst["HK10", False]*
            rateconst["HK11", False]*rateconst["HK2", False]*
            rateconst["HK3", False]*rateconst["HK4", False]*
            rateconst["HK5", False]*rateconst["HK6", False]*
            rateconst["HK7", False]*rateconst["HK8", False]*
            rateconst["HK9", False]*rateconst["Sink_23dpg[c]", False]*
            rateconst["Sink_adp[c]", False]*rateconst["Sink_atp[c]", False]*
            rateconst["Sink_g6p[c]", False]*rateconst["Sink_glc-D[c]", False]*
            rateconst["Sink_gthrd[c]", False]*rateconst["Sink_pi[c]", 
             False])) + metabolite["atp", "c"]*rateconst["HK2", True]*
         (-(metabolite["atp", "c"]*rateconst["HK6", True]*rateconst["HK7", 
             True]*rateconst["HK8", False]*rateconst["HK8", True]*
            (rateconst["HK10", True] + rateconst["HK11", True] + 
             (rateconst["HK1", True]*rateconst["HK10", True]*rateconst[
                "HK11", True]*rateconst["HK12", True]*rateconst["HK2", True]*
               rateconst["HK3", True]*rateconst["HK4", True]*rateconst["HK5", 
                True]*rateconst["HK6", True]*rateconst["HK7", True]*rateconst[
                "HK8", True]*rateconst["HK9", True]*rateconst[
                "Sink_23dpg[c]", True]*rateconst["Sink_adp[c]", True]*
               rateconst["Sink_atp[c]", True]*rateconst["Sink_g6p[c]", True]*
               rateconst["Sink_glc-D[c]", True]*rateconst["Sink_gthrd[c]", 
                True]*rateconst["Sink_pi[c]", True])/(250*rateconst["HK1", 
                False]*rateconst["HK10", False]*rateconst["HK11", False]*
               rateconst["HK2", False]*rateconst["HK3", False]*rateconst[
                "HK4", False]*rateconst["HK5", False]*rateconst["HK6", False]*
               rateconst["HK7", False]*rateconst["HK8", False]*rateconst[
                "HK9", False]*rateconst["Sink_23dpg[c]", False]*rateconst[
                "Sink_adp[c]", False]*rateconst["Sink_atp[c]", False]*
               rateconst["Sink_g6p[c]", False]*rateconst["Sink_glc-D[c]", 
                False]*rateconst["Sink_gthrd[c]", False]*rateconst[
                "Sink_pi[c]", False]))) + (rateconst["HK1", False] + 
            metabolite["atp", "c"]*rateconst["HK8", True])*
           (-(rateconst["HK1", True]*rateconst["HK10", True]*rateconst[
                "HK11", True]*rateconst["HK12", True]^2*rateconst["HK2", 
                True]*rateconst["HK3", True]*rateconst["HK4", True]*rateconst[
                "HK5", True]*rateconst["HK6", True]^2*rateconst["HK7", True]^
                2*rateconst["HK8", True]*rateconst["HK9", True]*rateconst[
                "Sink_23dpg[c]", True]*rateconst["Sink_adp[c]", True]*
               rateconst["Sink_atp[c]", True]*rateconst["Sink_g6p[c]", True]*
               rateconst["Sink_glc-D[c]", True]*rateconst["Sink_gthrd[c]", 
                True]*rateconst["Sink_pi[c]", True])/(250*rateconst["HK1", 
               False]*rateconst["HK10", False]*rateconst["HK11", False]*
              rateconst["HK2", False]*rateconst["HK3", False]*
              rateconst["HK4", False]*rateconst["HK5", False]*
              rateconst["HK6", False]*rateconst["HK7", False]*
              rateconst["HK8", False]*rateconst["HK9", False]*
              rateconst["Sink_23dpg[c]", False]*rateconst["Sink_adp[c]", 
               False]*rateconst["Sink_atp[c]", False]*rateconst[
               "Sink_g6p[c]", False]*rateconst["Sink_glc-D[c]", False]*
              rateconst["Sink_gthrd[c]", False]*rateconst["Sink_pi[c]", 
               False]) + rateconst["HK6", True]*rateconst["HK7", True]*
             (rateconst["HK12", True] + rateconst["HK8", False] + 
              rateconst["HK9", False])*(rateconst["HK10", True] + 
              rateconst["HK11", True] + (rateconst["HK1", True]*rateconst[
                 "HK10", True]*rateconst["HK11", True]*rateconst["HK12", 
                 True]*rateconst["HK2", True]*rateconst["HK3", True]*
                rateconst["HK4", True]*rateconst["HK5", True]*rateconst[
                 "HK6", True]*rateconst["HK7", True]*rateconst["HK8", True]*
                rateconst["HK9", True]*rateconst["Sink_23dpg[c]", True]*
                rateconst["Sink_adp[c]", True]*rateconst["Sink_atp[c]", True]*
                rateconst["Sink_g6p[c]", True]*rateconst["Sink_glc-D[c]", 
                 True]*rateconst["Sink_gthrd[c]", True]*rateconst[
                 "Sink_pi[c]", True])/(250*rateconst["HK1", False]*
                rateconst["HK10", False]*rateconst["HK11", False]*
                rateconst["HK2", False]*rateconst["HK3", False]*rateconst[
                 "HK4", False]*rateconst["HK5", False]*rateconst["HK6", 
                 False]*rateconst["HK7", False]*rateconst["HK8", False]*
                rateconst["HK9", False]*rateconst["Sink_23dpg[c]", False]*
                rateconst["Sink_adp[c]", False]*rateconst["Sink_atp[c]", 
                 False]*rateconst["Sink_g6p[c]", False]*rateconst[
                 "Sink_glc-D[c]", False]*rateconst["Sink_gthrd[c]", False]*
                rateconst["Sink_pi[c]", False]))))))/
      (-(metabolite["glc-D", "c"]*rateconst["HK6", True]*
         rateconst["HK7", True]*(rateconst["HK1", False] + 
          metabolite["atp", "c"]*rateconst["HK8", True])*
         rateconst["HK9", False]*rateconst["HK9", True]*
         (rateconst["HK10", True] + rateconst["HK11", True] + 
          (rateconst["HK1", True]*rateconst["HK10", True]*rateconst["HK11", 
             True]*rateconst["HK12", True]*rateconst["HK2", True]*
            rateconst["HK3", True]*rateconst["HK4", True]*rateconst["HK5", 
             True]*rateconst["HK6", True]*rateconst["HK7", True]*
            rateconst["HK8", True]*rateconst["HK9", True]*
            rateconst["Sink_23dpg[c]", True]*rateconst["Sink_adp[c]", True]*
            rateconst["Sink_atp[c]", True]*rateconst["Sink_g6p[c]", True]*
            rateconst["Sink_glc-D[c]", True]*rateconst["Sink_gthrd[c]", True]*
            rateconst["Sink_pi[c]", True])/(250*rateconst["HK1", False]*
            rateconst["HK10", False]*rateconst["HK11", False]*
            rateconst["HK2", False]*rateconst["HK3", False]*
            rateconst["HK4", False]*rateconst["HK5", False]*
            rateconst["HK6", False]*rateconst["HK7", False]*
            rateconst["HK8", False]*rateconst["HK9", False]*
            rateconst["Sink_23dpg[c]", False]*rateconst["Sink_adp[c]", False]*
            rateconst["Sink_atp[c]", False]*rateconst["Sink_g6p[c]", False]*
            rateconst["Sink_glc-D[c]", False]*rateconst["Sink_gthrd[c]", 
             False]*rateconst["Sink_pi[c]", False]))) + 
       (rateconst["HK2", False] + metabolite["glc-D", "c"]*
          rateconst["HK9", True])*(-(metabolite["atp", "c"]*
           rateconst["HK6", True]*rateconst["HK7", True]*rateconst["HK8", 
            False]*rateconst["HK8", True]*(rateconst["HK10", True] + 
            rateconst["HK11", True] + (rateconst["HK1", True]*
              rateconst["HK10", True]*rateconst["HK11", True]*
              rateconst["HK12", True]*rateconst["HK2", True]*
              rateconst["HK3", True]*rateconst["HK4", True]*rateconst["HK5", 
               True]*rateconst["HK6", True]*rateconst["HK7", True]*
              rateconst["HK8", True]*rateconst["HK9", True]*
              rateconst["Sink_23dpg[c]", True]*rateconst["Sink_adp[c]", True]*
              rateconst["Sink_atp[c]", True]*rateconst["Sink_g6p[c]", True]*
              rateconst["Sink_glc-D[c]", True]*rateconst["Sink_gthrd[c]", 
               True]*rateconst["Sink_pi[c]", True])/(250*rateconst["HK1", 
               False]*rateconst["HK10", False]*rateconst["HK11", False]*
              rateconst["HK2", False]*rateconst["HK3", False]*
              rateconst["HK4", False]*rateconst["HK5", False]*
              rateconst["HK6", False]*rateconst["HK7", False]*
              rateconst["HK8", False]*rateconst["HK9", False]*
              rateconst["Sink_23dpg[c]", False]*rateconst["Sink_adp[c]", 
               False]*rateconst["Sink_atp[c]", False]*rateconst[
               "Sink_g6p[c]", False]*rateconst["Sink_glc-D[c]", False]*
              rateconst["Sink_gthrd[c]", False]*rateconst["Sink_pi[c]", 
               False]))) + (rateconst["HK1", False] + metabolite["atp", "c"]*
            rateconst["HK8", True])*(-(rateconst["HK1", True]*
              rateconst["HK10", True]*rateconst["HK11", True]*
              rateconst["HK12", True]^2*rateconst["HK2", True]*
              rateconst["HK3", True]*rateconst["HK4", True]*rateconst["HK5", 
               True]*rateconst["HK6", True]^2*rateconst["HK7", True]^2*
              rateconst["HK8", True]*rateconst["HK9", True]*
              rateconst["Sink_23dpg[c]", True]*rateconst["Sink_adp[c]", True]*
              rateconst["Sink_atp[c]", True]*rateconst["Sink_g6p[c]", True]*
              rateconst["Sink_glc-D[c]", True]*rateconst["Sink_gthrd[c]", 
               True]*rateconst["Sink_pi[c]", True])/
            (250*rateconst["HK1", False]*rateconst["HK10", False]*
             rateconst["HK11", False]*rateconst["HK2", False]*
             rateconst["HK3", False]*rateconst["HK4", False]*
             rateconst["HK5", False]*rateconst["HK6", False]*
             rateconst["HK7", False]*rateconst["HK8", False]*
             rateconst["HK9", False]*rateconst["Sink_23dpg[c]", False]*
             rateconst["Sink_adp[c]", False]*rateconst["Sink_atp[c]", False]*
             rateconst["Sink_g6p[c]", False]*rateconst["Sink_glc-D[c]", 
              False]*rateconst["Sink_gthrd[c]", False]*rateconst[
              "Sink_pi[c]", False]) + rateconst["HK6", True]*
            rateconst["HK7", True]*(rateconst["HK12", True] + 
             rateconst["HK8", False] + rateconst["HK9", False])*
            (rateconst["HK10", True] + rateconst["HK11", True] + 
             (rateconst["HK1", True]*rateconst["HK10", True]*rateconst[
                "HK11", True]*rateconst["HK12", True]*rateconst["HK2", True]*
               rateconst["HK3", True]*rateconst["HK4", True]*rateconst["HK5", 
                True]*rateconst["HK6", True]*rateconst["HK7", True]*rateconst[
                "HK8", True]*rateconst["HK9", True]*rateconst[
                "Sink_23dpg[c]", True]*rateconst["Sink_adp[c]", True]*
               rateconst["Sink_atp[c]", True]*rateconst["Sink_g6p[c]", True]*
               rateconst["Sink_glc-D[c]", True]*rateconst["Sink_gthrd[c]", 
                True]*rateconst["Sink_pi[c]", True])/(250*rateconst["HK1", 
                False]*rateconst["HK10", False]*rateconst["HK11", False]*
               rateconst["HK2", False]*rateconst["HK3", False]*rateconst[
                "HK4", False]*rateconst["HK5", False]*rateconst["HK6", False]*
               rateconst["HK7", False]*rateconst["HK8", False]*rateconst[
                "HK9", False]*rateconst["Sink_23dpg[c]", False]*rateconst[
                "Sink_adp[c]", False]*rateconst["Sink_atp[c]", False]*
               rateconst["Sink_g6p[c]", False]*rateconst["Sink_glc-D[c]", 
                False]*rateconst["Sink_gthrd[c]", False]*rateconst[
                "Sink_pi[c]", False])))))))/
   (Keq["HK12"]*(-((rateconst["HK3", False]*rateconst["HK4", False]*
         rateconst["HK5", False]*(rateconst["HK1", False] + 
          metabolite["atp", "c"]*rateconst["HK8", True])*
         rateconst["HK9", False]*(metabolite["glc-D", "c"]*
           (-(rateconst["HK11", True]*rateconst["HK6", True]) + 
            rateconst["HK11", True]*rateconst["HK7", True] + 
            rateconst["HK6", True]*rateconst["HK7", True])*
           rateconst["HK9", True] + (rateconst["HK1", True]*
            rateconst["HK10", True]*rateconst["HK11", True]*
            rateconst["HK12", True]*rateconst["HK2", True]*rateconst["HK3", 
             True]*rateconst["HK4", True]*rateconst["HK5", True]*
            rateconst["HK6", True]^2*(rateconst["HK2", False] - 
             rateconst["HK7", True])*rateconst["HK7", True]*
            rateconst["HK8", True]*rateconst["HK9", True]*
            rateconst["Sink_23dpg[c]", True]*rateconst["Sink_adp[c]", True]*
            rateconst["Sink_atp[c]", True]*rateconst["Sink_g6p[c]", True]*
            rateconst["Sink_glc-D[c]", True]*rateconst["Sink_gthrd[c]", True]*
            rateconst["Sink_pi[c]", True])/(250*rateconst["HK1", False]*
            rateconst["HK10", False]*rateconst["HK11", False]*
            rateconst["HK2", False]*rateconst["HK3", False]*
            rateconst["HK4", False]*rateconst["HK5", False]*
            rateconst["HK6", False]*rateconst["HK7", False]*
            rateconst["HK8", False]*rateconst["HK9", False]*
            rateconst["Sink_23dpg[c]", False]*rateconst["Sink_adp[c]", False]*
            rateconst["Sink_atp[c]", False]*rateconst["Sink_g6p[c]", False]*
            rateconst["Sink_glc-D[c]", False]*rateconst["Sink_gthrd[c]", 
             False]*rateconst["Sink_pi[c]", False])) - 
        (rateconst["HK2", False] + metabolite["glc-D", "c"]*
           rateconst["HK9", True])*(rateconst["HK3", False]*
           rateconst["HK4", False]*rateconst["HK5", False]*
           (rateconst["HK1", False] + metabolite["atp", "c"]*
             rateconst["HK8", True])*((rateconst["HK6", True]*rateconst[
                "HK7", True] + rateconst["HK11", True]*(-rateconst["HK6", 
                  True] + rateconst["HK7", True]))*(rateconst["HK12", True] + 
              rateconst["HK8", False] + rateconst["HK9", False]) + 
            (rateconst["HK1", True]*rateconst["HK10", True]*rateconst["HK11", 
               True]*rateconst["HK12", True]*rateconst["HK2", True]*
              rateconst["HK3", True]*rateconst["HK4", True]*rateconst["HK5", 
               True]*rateconst["HK6", True]^2*rateconst["HK7", True]^2*
              rateconst["HK8", True]*rateconst["HK9", True]*
              rateconst["Sink_23dpg[c]", True]*rateconst["Sink_adp[c]", True]*
              rateconst["Sink_atp[c]", True]*rateconst["Sink_g6p[c]", True]*
              rateconst["Sink_glc-D[c]", True]*rateconst["Sink_gthrd[c]", 
               True]*rateconst["Sink_pi[c]", True])/(250*rateconst["HK1", 
               False]*rateconst["HK10", False]*rateconst["HK11", False]*
              rateconst["HK2", False]*rateconst["HK3", False]*
              rateconst["HK4", False]*rateconst["HK5", False]*
              rateconst["HK6", False]*rateconst["HK7", False]*
              rateconst["HK8", False]*rateconst["HK9", False]*
              rateconst["Sink_23dpg[c]", False]*rateconst["Sink_adp[c]", 
               False]*rateconst["Sink_atp[c]", False]*rateconst[
               "Sink_g6p[c]", False]*rateconst["Sink_glc-D[c]", False]*
              rateconst["Sink_gthrd[c]", False]*rateconst["Sink_pi[c]", 
               False])) + rateconst["HK8", False]*
           (-(metabolite["atp", "c"]*rateconst["HK3", False]*
              rateconst["HK4", False]*rateconst["HK5", False]*
              (rateconst["HK6", True]*rateconst["HK7", True] + rateconst[
                 "HK11", True]*(-rateconst["HK6", True] + rateconst["HK7", 
                  True]))*rateconst["HK8", True]) - 
            (rateconst["HK1", True]*rateconst["HK10", True]*rateconst["HK11", 
               True]*rateconst["HK12", True]*rateconst["HK2", True]*
              rateconst["HK3", True]*rateconst["HK4", True]*rateconst["HK5", 
               True]*rateconst["HK6", True]^2*rateconst["HK7", True]*
              (rateconst["HK1", False]*rateconst["HK3", False]*rateconst[
                 "HK4", False]*rateconst["HK5", False] - (metabolite["gthrd", 
                   "c"]*rateconst["HK3", True]*rateconst["HK4", False]*
                  rateconst["HK5", False] + rateconst["HK3", False]*
                  (rateconst["HK4", False]*rateconst["HK5", False] + 
                   metabolite["23dpg", "c"]*rateconst["HK4", True]*rateconst[
                     "HK5", False] + metabolite["pi", "c"]*rateconst["HK4", 
                     False]*rateconst["HK5", True]))*rateconst["HK7", True])*
              rateconst["HK8", True]*rateconst["HK9", True]*
              rateconst["Sink_23dpg[c]", True]*rateconst["Sink_adp[c]", True]*
              rateconst["Sink_atp[c]", True]*rateconst["Sink_g6p[c]", True]*
              rateconst["Sink_glc-D[c]", True]*rateconst["Sink_gthrd[c]", 
               True]*rateconst["Sink_pi[c]", True])/(250*rateconst["HK1", 
               False]*rateconst["HK10", False]*rateconst["HK11", False]*
              rateconst["HK2", False]*rateconst["HK3", False]*
              rateconst["HK4", False]*rateconst["HK5", False]*
              rateconst["HK6", False]*rateconst["HK7", False]*
              rateconst["HK8", False]*rateconst["HK9", False]*
              rateconst["Sink_23dpg[c]", False]*rateconst["Sink_adp[c]", 
               False]*rateconst["Sink_atp[c]", False]*rateconst[
               "Sink_g6p[c]", False]*rateconst["Sink_glc-D[c]", False]*
              rateconst["Sink_gthrd[c]", False]*rateconst["Sink_pi[c]", 
               False]))))*(metabolite["atp", "c"]*metabolite["glc-D", "c"]*
         rateconst["HK1", True]*rateconst["HK6", True]*rateconst["HK7", True]*
         rateconst["HK8", True]*rateconst["HK9", False]*
         (rateconst["HK10", True] + rateconst["HK11", True] + 
          (rateconst["HK1", True]*rateconst["HK10", True]*rateconst["HK11", 
             True]*rateconst["HK12", True]*rateconst["HK2", True]*
            rateconst["HK3", True]*rateconst["HK4", True]*rateconst["HK5", 
             True]*rateconst["HK6", True]*rateconst["HK7", True]*
            rateconst["HK8", True]*rateconst["HK9", True]*
            rateconst["Sink_23dpg[c]", True]*rateconst["Sink_adp[c]", True]*
            rateconst["Sink_atp[c]", True]*rateconst["Sink_g6p[c]", True]*
            rateconst["Sink_glc-D[c]", True]*rateconst["Sink_gthrd[c]", True]*
            rateconst["Sink_pi[c]", True])/(250*rateconst["HK1", False]*
            rateconst["HK10", False]*rateconst["HK11", False]*
            rateconst["HK2", False]*rateconst["HK3", False]*
            rateconst["HK4", False]*rateconst["HK5", False]*
            rateconst["HK6", False]*rateconst["HK7", False]*
            rateconst["HK8", False]*rateconst["HK9", False]*
            rateconst["Sink_23dpg[c]", False]*rateconst["Sink_adp[c]", False]*
            rateconst["Sink_atp[c]", False]*rateconst["Sink_g6p[c]", False]*
            rateconst["Sink_glc-D[c]", False]*rateconst["Sink_gthrd[c]", 
             False]*rateconst["Sink_pi[c]", False])) + metabolite["atp", "c"]*
         rateconst["HK2", True]*(-(metabolite["atp", "c"]*rateconst["HK6", 
             True]*rateconst["HK7", True]*rateconst["HK8", False]*
            rateconst["HK8", True]*(rateconst["HK10", True] + 
             rateconst["HK11", True] + (rateconst["HK1", True]*rateconst[
                "HK10", True]*rateconst["HK11", True]*rateconst["HK12", True]*
               rateconst["HK2", True]*rateconst["HK3", True]*rateconst["HK4", 
                True]*rateconst["HK5", True]*rateconst["HK6", True]*rateconst[
                "HK7", True]*rateconst["HK8", True]*rateconst["HK9", True]*
               rateconst["Sink_23dpg[c]", True]*rateconst["Sink_adp[c]", 
                True]*rateconst["Sink_atp[c]", True]*rateconst["Sink_g6p[c]", 
                True]*rateconst["Sink_glc-D[c]", True]*rateconst[
                "Sink_gthrd[c]", True]*rateconst["Sink_pi[c]", True])/
              (250*rateconst["HK1", False]*rateconst["HK10", False]*rateconst[
                "HK11", False]*rateconst["HK2", False]*rateconst["HK3", 
                False]*rateconst["HK4", False]*rateconst["HK5", False]*
               rateconst["HK6", False]*rateconst["HK7", False]*rateconst[
                "HK8", False]*rateconst["HK9", False]*rateconst[
                "Sink_23dpg[c]", False]*rateconst["Sink_adp[c]", False]*
               rateconst["Sink_atp[c]", False]*rateconst["Sink_g6p[c]", 
                False]*rateconst["Sink_glc-D[c]", False]*rateconst[
                "Sink_gthrd[c]", False]*rateconst["Sink_pi[c]", False]))) + 
          (rateconst["HK1", False] + metabolite["atp", "c"]*rateconst["HK8", 
              True])*(-(rateconst["HK1", True]*rateconst["HK10", True]*
               rateconst["HK11", True]*rateconst["HK12", True]^2*rateconst[
                "HK2", True]*rateconst["HK3", True]*rateconst["HK4", True]*
               rateconst["HK5", True]*rateconst["HK6", True]^2*rateconst[
                 "HK7", True]^2*rateconst["HK8", True]*rateconst["HK9", True]*
               rateconst["Sink_23dpg[c]", True]*rateconst["Sink_adp[c]", 
                True]*rateconst["Sink_atp[c]", True]*rateconst["Sink_g6p[c]", 
                True]*rateconst["Sink_glc-D[c]", True]*rateconst[
                "Sink_gthrd[c]", True]*rateconst["Sink_pi[c]", True])/
             (250*rateconst["HK1", False]*rateconst["HK10", False]*
              rateconst["HK11", False]*rateconst["HK2", False]*
              rateconst["HK3", False]*rateconst["HK4", False]*
              rateconst["HK5", False]*rateconst["HK6", False]*
              rateconst["HK7", False]*rateconst["HK8", False]*
              rateconst["HK9", False]*rateconst["Sink_23dpg[c]", False]*
              rateconst["Sink_adp[c]", False]*rateconst["Sink_atp[c]", False]*
              rateconst["Sink_g6p[c]", False]*rateconst["Sink_glc-D[c]", 
               False]*rateconst["Sink_gthrd[c]", False]*rateconst[
               "Sink_pi[c]", False]) + rateconst["HK6", True]*
             rateconst["HK7", True]*(rateconst["HK12", True] + 
              rateconst["HK8", False] + rateconst["HK9", False])*
             (rateconst["HK10", True] + rateconst["HK11", True] + 
              (rateconst["HK1", True]*rateconst["HK10", True]*rateconst[
                 "HK11", True]*rateconst["HK12", True]*rateconst["HK2", True]*
                rateconst["HK3", True]*rateconst["HK4", True]*rateconst[
                 "HK5", True]*rateconst["HK6", True]*rateconst["HK7", True]*
                rateconst["HK8", True]*rateconst["HK9", True]*rateconst[
                 "Sink_23dpg[c]", True]*rateconst["Sink_adp[c]", True]*
                rateconst["Sink_atp[c]", True]*rateconst["Sink_g6p[c]", True]*
                rateconst["Sink_glc-D[c]", True]*rateconst["Sink_gthrd[c]", 
                 True]*rateconst["Sink_pi[c]", True])/(250*rateconst["HK1", 
                 False]*rateconst["HK10", False]*rateconst["HK11", False]*
                rateconst["HK2", False]*rateconst["HK3", False]*rateconst[
                 "HK4", False]*rateconst["HK5", False]*rateconst["HK6", 
                 False]*rateconst["HK7", False]*rateconst["HK8", False]*
                rateconst["HK9", False]*rateconst["Sink_23dpg[c]", False]*
                rateconst["Sink_adp[c]", False]*rateconst["Sink_atp[c]", 
                 False]*rateconst["Sink_g6p[c]", False]*rateconst[
                 "Sink_glc-D[c]", False]*rateconst["Sink_gthrd[c]", False]*
                rateconst["Sink_pi[c]", False])))))) + 
     (-(rateconst["HK9", False]*((rateconst["HK1", True]*rateconst["HK10", 
             True]*rateconst["HK11", True]*rateconst["HK12", True]*
            rateconst["HK2", True]*rateconst["HK3", True]*rateconst["HK4", 
             True]*rateconst["HK5", True]*rateconst["HK6", True]^2*
            rateconst["HK7", True]*(metabolite["glc-D", "c"]*
              rateconst["HK1", True] + metabolite["atp", "c"]*
              rateconst["HK2", True] + rateconst["HK7", True])*
            rateconst["HK8", True]*(rateconst["HK1", False] + 
             metabolite["atp", "c"]*rateconst["HK8", True])*
            rateconst["HK9", True]*rateconst["Sink_23dpg[c]", True]*
            rateconst["Sink_adp[c]", True]*rateconst["Sink_atp[c]", True]*
            rateconst["Sink_g6p[c]", True]*rateconst["Sink_glc-D[c]", True]*
            rateconst["Sink_gthrd[c]", True]*rateconst["Sink_pi[c]", True])/
           (250*rateconst["HK1", False]*rateconst["HK10", False]*
            rateconst["HK11", False]*rateconst["HK2", False]*
            rateconst["HK6", False]*rateconst["HK7", False]*
            rateconst["HK8", False]*rateconst["HK9", False]*
            rateconst["Sink_23dpg[c]", False]*rateconst["Sink_adp[c]", False]*
            rateconst["Sink_atp[c]", False]*rateconst["Sink_g6p[c]", False]*
            rateconst["Sink_glc-D[c]", False]*rateconst["Sink_gthrd[c]", 
             False]*rateconst["Sink_pi[c]", False]) + 
          metabolite["glc-D", "c"]*rateconst["HK1", True]*
           (-(metabolite["atp", "c"]*rateconst["HK3", False]*
              rateconst["HK4", False]*rateconst["HK5", False]*
              (rateconst["HK6", True]*rateconst["HK7", True] + rateconst[
                 "HK11", True]*(-rateconst["HK6", True] + rateconst["HK7", 
                  True]))*rateconst["HK8", True]) - 
            (rateconst["HK1", True]*rateconst["HK10", True]*rateconst["HK11", 
               True]*rateconst["HK12", True]*rateconst["HK2", True]*
              rateconst["HK3", True]*rateconst["HK4", True]*rateconst["HK5", 
               True]*rateconst["HK6", True]^2*rateconst["HK7", True]*
              (rateconst["HK1", False]*rateconst["HK3", False]*rateconst[
                 "HK4", False]*rateconst["HK5", False] - (metabolite["gthrd", 
                   "c"]*rateconst["HK3", True]*rateconst["HK4", False]*
                  rateconst["HK5", False] + rateconst["HK3", False]*
                  (rateconst["HK4", False]*rateconst["HK5", False] + 
                   metabolite["23dpg", "c"]*rateconst["HK4", True]*rateconst[
                     "HK5", False] + metabolite["pi", "c"]*rateconst["HK4", 
                     False]*rateconst["HK5", True]))*rateconst["HK7", True])*
              rateconst["HK8", True]*rateconst["HK9", True]*
              rateconst["Sink_23dpg[c]", True]*rateconst["Sink_adp[c]", True]*
              rateconst["Sink_atp[c]", True]*rateconst["Sink_g6p[c]", True]*
              rateconst["Sink_glc-D[c]", True]*rateconst["Sink_gthrd[c]", 
               True]*rateconst["Sink_pi[c]", True])/(250*rateconst["HK1", 
               False]*rateconst["HK10", False]*rateconst["HK11", False]*
              rateconst["HK2", False]*rateconst["HK3", False]*
              rateconst["HK4", False]*rateconst["HK5", False]*
              rateconst["HK6", False]*rateconst["HK7", False]*
              rateconst["HK8", False]*rateconst["HK9", False]*
              rateconst["Sink_23dpg[c]", False]*rateconst["Sink_adp[c]", 
               False]*rateconst["Sink_atp[c]", False]*rateconst[
               "Sink_g6p[c]", False]*rateconst["Sink_glc-D[c]", False]*
              rateconst["Sink_gthrd[c]", False]*rateconst["Sink_pi[c]", 
               False])))) + metabolite["atp", "c"]*rateconst["HK2", True]*
        (rateconst["HK3", False]*rateconst["HK4", False]*
          rateconst["HK5", False]*(rateconst["HK1", False] + 
           metabolite["atp", "c"]*rateconst["HK8", True])*
          ((rateconst["HK6", True]*rateconst["HK7", True] + 
             rateconst["HK11", True]*(-rateconst["HK6", True] + rateconst[
                "HK7", True]))*(rateconst["HK12", True] + rateconst["HK8", 
              False] + rateconst["HK9", False]) + (rateconst["HK1", True]*
             rateconst["HK10", True]*rateconst["HK11", True]*
             rateconst["HK12", True]*rateconst["HK2", True]*rateconst["HK3", 
              True]*rateconst["HK4", True]*rateconst["HK5", True]*
             rateconst["HK6", True]^2*rateconst["HK7", True]^2*
             rateconst["HK8", True]*rateconst["HK9", True]*
             rateconst["Sink_23dpg[c]", True]*rateconst["Sink_adp[c]", True]*
             rateconst["Sink_atp[c]", True]*rateconst["Sink_g6p[c]", True]*
             rateconst["Sink_glc-D[c]", True]*rateconst["Sink_gthrd[c]", 
              True]*rateconst["Sink_pi[c]", True])/(250*rateconst["HK1", 
              False]*rateconst["HK10", False]*rateconst["HK11", False]*
             rateconst["HK2", False]*rateconst["HK3", False]*
             rateconst["HK4", False]*rateconst["HK5", False]*
             rateconst["HK6", False]*rateconst["HK7", False]*
             rateconst["HK8", False]*rateconst["HK9", False]*
             rateconst["Sink_23dpg[c]", False]*rateconst["Sink_adp[c]", 
              False]*rateconst["Sink_atp[c]", False]*rateconst["Sink_g6p[c]", 
              False]*rateconst["Sink_glc-D[c]", False]*rateconst[
              "Sink_gthrd[c]", False]*rateconst["Sink_pi[c]", False])) + 
         rateconst["HK8", False]*(-(metabolite["atp", "c"]*rateconst["HK3", 
              False]*rateconst["HK4", False]*rateconst["HK5", False]*
             (rateconst["HK6", True]*rateconst["HK7", True] + 
              rateconst["HK11", True]*(-rateconst["HK6", True] + 
                rateconst["HK7", True]))*rateconst["HK8", True]) - 
           (rateconst["HK1", True]*rateconst["HK10", True]*rateconst["HK11", 
              True]*rateconst["HK12", True]*rateconst["HK2", True]*
             rateconst["HK3", True]*rateconst["HK4", True]*rateconst["HK5", 
              True]*rateconst["HK6", True]^2*rateconst["HK7", True]*
             (rateconst["HK1", False]*rateconst["HK3", False]*rateconst[
                "HK4", False]*rateconst["HK5", False] - 
              (metabolite["gthrd", "c"]*rateconst["HK3", True]*rateconst[
                  "HK4", False]*rateconst["HK5", False] + rateconst["HK3", 
                  False]*(rateconst["HK4", False]*rateconst["HK5", False] + 
                  metabolite["23dpg", "c"]*rateconst["HK4", True]*rateconst[
                    "HK5", False] + metabolite["pi", "c"]*rateconst["HK4", 
                    False]*rateconst["HK5", True]))*rateconst["HK7", True])*
             rateconst["HK8", True]*rateconst["HK9", True]*
             rateconst["Sink_23dpg[c]", True]*rateconst["Sink_adp[c]", True]*
             rateconst["Sink_atp[c]", True]*rateconst["Sink_g6p[c]", True]*
             rateconst["Sink_glc-D[c]", True]*rateconst["Sink_gthrd[c]", 
              True]*rateconst["Sink_pi[c]", True])/(250*rateconst["HK1", 
              False]*rateconst["HK10", False]*rateconst["HK11", False]*
             rateconst["HK2", False]*rateconst["HK3", False]*
             rateconst["HK4", False]*rateconst["HK5", False]*
             rateconst["HK6", False]*rateconst["HK7", False]*
             rateconst["HK8", False]*rateconst["HK9", False]*
             rateconst["Sink_23dpg[c]", False]*rateconst["Sink_adp[c]", 
              False]*rateconst["Sink_atp[c]", False]*rateconst["Sink_g6p[c]", 
              False]*rateconst["Sink_glc-D[c]", False]*rateconst[
              "Sink_gthrd[c]", False]*rateconst["Sink_pi[c]", False]))))*
      (metabolite["glc-D", "c"]*rateconst["HK6", True]*rateconst["HK7", True]*
        (rateconst["HK1", False] + metabolite["atp", "c"]*
          rateconst["HK8", True])*rateconst["HK9", False]*
        rateconst["HK9", True]*(rateconst["HK10", True] + 
         rateconst["HK11", True] + (rateconst["HK1", True]*
           rateconst["HK10", True]*rateconst["HK11", True]*
           rateconst["HK12", True]*rateconst["HK2", True]*rateconst["HK3", 
            True]*rateconst["HK4", True]*rateconst["HK5", True]*
           rateconst["HK6", True]*rateconst["HK7", True]*rateconst["HK8", 
            True]*rateconst["HK9", True]*rateconst["Sink_23dpg[c]", True]*
           rateconst["Sink_adp[c]", True]*rateconst["Sink_atp[c]", True]*
           rateconst["Sink_g6p[c]", True]*rateconst["Sink_glc-D[c]", True]*
           rateconst["Sink_gthrd[c]", True]*rateconst["Sink_pi[c]", True])/
          (250*rateconst["HK1", False]*rateconst["HK10", False]*
           rateconst["HK11", False]*rateconst["HK2", False]*
           rateconst["HK3", False]*rateconst["HK4", False]*
           rateconst["HK5", False]*rateconst["HK6", False]*
           rateconst["HK7", False]*rateconst["HK8", False]*
           rateconst["HK9", False]*rateconst["Sink_23dpg[c]", False]*
           rateconst["Sink_adp[c]", False]*rateconst["Sink_atp[c]", False]*
           rateconst["Sink_g6p[c]", False]*rateconst["Sink_glc-D[c]", False]*
           rateconst["Sink_gthrd[c]", False]*rateconst["Sink_pi[c]", 
            False])) - (rateconst["HK2", False] + metabolite["glc-D", "c"]*
          rateconst["HK9", True])*(-(metabolite["atp", "c"]*
           rateconst["HK6", True]*rateconst["HK7", True]*rateconst["HK8", 
            False]*rateconst["HK8", True]*(rateconst["HK10", True] + 
            rateconst["HK11", True] + (rateconst["HK1", True]*
              rateconst["HK10", True]*rateconst["HK11", True]*
              rateconst["HK12", True]*rateconst["HK2", True]*
              rateconst["HK3", True]*rateconst["HK4", True]*rateconst["HK5", 
               True]*rateconst["HK6", True]*rateconst["HK7", True]*
              rateconst["HK8", True]*rateconst["HK9", True]*
              rateconst["Sink_23dpg[c]", True]*rateconst["Sink_adp[c]", True]*
              rateconst["Sink_atp[c]", True]*rateconst["Sink_g6p[c]", True]*
              rateconst["Sink_glc-D[c]", True]*rateconst["Sink_gthrd[c]", 
               True]*rateconst["Sink_pi[c]", True])/(250*rateconst["HK1", 
               False]*rateconst["HK10", False]*rateconst["HK11", False]*
              rateconst["HK2", False]*rateconst["HK3", False]*
              rateconst["HK4", False]*rateconst["HK5", False]*
              rateconst["HK6", False]*rateconst["HK7", False]*
              rateconst["HK8", False]*rateconst["HK9", False]*
              rateconst["Sink_23dpg[c]", False]*rateconst["Sink_adp[c]", 
               False]*rateconst["Sink_atp[c]", False]*rateconst[
               "Sink_g6p[c]", False]*rateconst["Sink_glc-D[c]", False]*
              rateconst["Sink_gthrd[c]", False]*rateconst["Sink_pi[c]", 
               False]))) + (rateconst["HK1", False] + metabolite["atp", "c"]*
            rateconst["HK8", True])*(-(rateconst["HK1", True]*
              rateconst["HK10", True]*rateconst["HK11", True]*
              rateconst["HK12", True]^2*rateconst["HK2", True]*
              rateconst["HK3", True]*rateconst["HK4", True]*rateconst["HK5", 
               True]*rateconst["HK6", True]^2*rateconst["HK7", True]^2*
              rateconst["HK8", True]*rateconst["HK9", True]*
              rateconst["Sink_23dpg[c]", True]*rateconst["Sink_adp[c]", True]*
              rateconst["Sink_atp[c]", True]*rateconst["Sink_g6p[c]", True]*
              rateconst["Sink_glc-D[c]", True]*rateconst["Sink_gthrd[c]", 
               True]*rateconst["Sink_pi[c]", True])/
            (250*rateconst["HK1", False]*rateconst["HK10", False]*
             rateconst["HK11", False]*rateconst["HK2", False]*
             rateconst["HK3", False]*rateconst["HK4", False]*
             rateconst["HK5", False]*rateconst["HK6", False]*
             rateconst["HK7", False]*rateconst["HK8", False]*
             rateconst["HK9", False]*rateconst["Sink_23dpg[c]", False]*
             rateconst["Sink_adp[c]", False]*rateconst["Sink_atp[c]", False]*
             rateconst["Sink_g6p[c]", False]*rateconst["Sink_glc-D[c]", 
              False]*rateconst["Sink_gthrd[c]", False]*rateconst[
              "Sink_pi[c]", False]) + rateconst["HK6", True]*
            rateconst["HK7", True]*(rateconst["HK12", True] + 
             rateconst["HK8", False] + rateconst["HK9", False])*
            (rateconst["HK10", True] + rateconst["HK11", True] + 
             (rateconst["HK1", True]*rateconst["HK10", True]*rateconst[
                "HK11", True]*rateconst["HK12", True]*rateconst["HK2", True]*
               rateconst["HK3", True]*rateconst["HK4", True]*rateconst["HK5", 
                True]*rateconst["HK6", True]*rateconst["HK7", True]*rateconst[
                "HK8", True]*rateconst["HK9", True]*rateconst[
                "Sink_23dpg[c]", True]*rateconst["Sink_adp[c]", True]*
               rateconst["Sink_atp[c]", True]*rateconst["Sink_g6p[c]", True]*
               rateconst["Sink_glc-D[c]", True]*rateconst["Sink_gthrd[c]", 
                True]*rateconst["Sink_pi[c]", True])/(250*rateconst["HK1", 
                False]*rateconst["HK10", False]*rateconst["HK11", False]*
               rateconst["HK2", False]*rateconst["HK3", False]*rateconst[
                "HK4", False]*rateconst["HK5", False]*rateconst["HK6", False]*
               rateconst["HK7", False]*rateconst["HK8", False]*rateconst[
                "HK9", False]*rateconst["Sink_23dpg[c]", False]*rateconst[
                "Sink_adp[c]", False]*rateconst["Sink_atp[c]", False]*
               rateconst["Sink_g6p[c]", False]*rateconst["Sink_glc-D[c]", 
                False]*rateconst["Sink_gthrd[c]", False]*rateconst[
                "Sink_pi[c]", False]))))))))
