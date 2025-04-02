import { inject } from '@angular/core';
import { HttpResponse } from '@angular/common/http';
import { ActivatedRouteSnapshot, Router } from '@angular/router';
import { EMPTY, Observable, of } from 'rxjs';
import { mergeMap } from 'rxjs/operators';

import { IParentorganization } from '../parentorganization.model';
import { ParentorganizationService } from '../service/parentorganization.service';

const parentorganizationResolve = (route: ActivatedRouteSnapshot): Observable<null | IParentorganization> => {
  const id = route.params.id;
  if (id) {
    return inject(ParentorganizationService)
      .find(id)
      .pipe(
        mergeMap((parentorganization: HttpResponse<IParentorganization>) => {
          if (parentorganization.body) {
            return of(parentorganization.body);
          }
          inject(Router).navigate(['404']);
          return EMPTY;
        }),
      );
  }
  return of(null);
};

export default parentorganizationResolve;
