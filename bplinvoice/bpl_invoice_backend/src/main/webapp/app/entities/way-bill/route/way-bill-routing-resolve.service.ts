import { inject } from '@angular/core';
import { HttpResponse } from '@angular/common/http';
import { ActivatedRouteSnapshot, Router } from '@angular/router';
import { EMPTY, Observable, of } from 'rxjs';
import { mergeMap } from 'rxjs/operators';

import { IWayBill } from '../way-bill.model';
import { WayBillService } from '../service/way-bill.service';

const wayBillResolve = (route: ActivatedRouteSnapshot): Observable<null | IWayBill> => {
  const id = route.params.id;
  if (id) {
    return inject(WayBillService)
      .find(id)
      .pipe(
        mergeMap((wayBill: HttpResponse<IWayBill>) => {
          if (wayBill.body) {
            return of(wayBill.body);
          }
          inject(Router).navigate(['404']);
          return EMPTY;
        }),
      );
  }
  return of(null);
};

export default wayBillResolve;
