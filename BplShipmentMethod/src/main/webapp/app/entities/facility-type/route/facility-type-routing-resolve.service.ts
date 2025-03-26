import { inject } from '@angular/core';
import { HttpResponse } from '@angular/common/http';
import { ActivatedRouteSnapshot, Router } from '@angular/router';
import { EMPTY, Observable, of } from 'rxjs';
import { mergeMap } from 'rxjs/operators';

import { IFacilityType } from '../facility-type.model';
import { FacilityTypeService } from '../service/facility-type.service';

const facilityTypeResolve = (route: ActivatedRouteSnapshot): Observable<null | IFacilityType> => {
  const id = route.params.id;
  if (id) {
    return inject(FacilityTypeService)
      .find(id)
      .pipe(
        mergeMap((facilityType: HttpResponse<IFacilityType>) => {
          if (facilityType.body) {
            return of(facilityType.body);
          }
          inject(Router).navigate(['404']);
          return EMPTY;
        }),
      );
  }
  return of(null);
};

export default facilityTypeResolve;
