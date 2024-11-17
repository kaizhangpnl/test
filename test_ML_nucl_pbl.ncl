

begin 

   zm  = fspan(20.,2020.,81) 
   pbl = fspan(40.,1540.,31)  

   mzm  = dimsizes(zm) 
   mpbl = dimsizes(pbl) 

   npbl = zm
   npbl = -999
   npbl@_FillValue = -999

   ;;.............................................
   ;; maxpbl(mpbl) 
   ;;.............................................
   
   maxpbl = where(pbl.gt.100., pbl, 100.) 

   do ipbl = 0, mpbl-1 
   do izm  = 0, mzm-1 
        
      ;;.......................................................... 
      ;; npbl = xr.where(zm <= max_pbl, (zm - pbl) / pbl, npbl) 
      ;;.......................................................... 

      npbl   = where(zm .le. maxpbl(ipbl), (zm - pbl(ipbl)) / pbl(ipbl), npbl) 

      print("     PBLH: "   + sprintf("%8.3f",pbl(ipbl)) + \
            "     MAXPBL: " + sprintf("%8.3f",maxpbl(ipbl))   + \
            "     ZM: "     + sprintf("%8.3f",zm(izm))   + \
            "     NPBL: "   + sprintf("%8.3f",npbl(izm)))
 
   end do 
   end do 
 
end



