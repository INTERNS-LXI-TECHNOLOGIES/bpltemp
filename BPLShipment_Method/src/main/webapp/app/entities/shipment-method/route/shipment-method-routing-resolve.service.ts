import { inject } from '@angular/core';
import { HttpResponse } from '@angular/common/http';
import { ActivatedRouteSnapshot, Router } from '@angular/router';
import { EMPTY, Observable, of } from 'rxjs';
import { mergeMap } from 'rxjs/operators';

import { IShipmentMethod } from '../shipment-method.model';
import { ShipmentMethodService } from '../service/shipment-method.service';

const shipmentMethodResolve = (route: ActivatedRouteSnapshot): Observable<null | IShipmentMethod> => {
  const id = route.params.id;
  if (id) {
    return inject(ShipmentMethodService)
      .find(id)
      .pipe(
        mergeMap((shipmentMethod: HttpResponse<IShipmentMethod>) => {
          if (shipmentMethod.body) {
            return of(shipmentMethod.body);
          }
          inject(Router).navigate(['404']);
          return EMPTY;
        }),
      );
  }
  return of(null);
};

export default shipmentMethodResolve;
