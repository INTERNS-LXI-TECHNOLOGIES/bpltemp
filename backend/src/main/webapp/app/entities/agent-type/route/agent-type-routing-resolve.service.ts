import { inject } from '@angular/core';
import { HttpResponse } from '@angular/common/http';
import { ActivatedRouteSnapshot, Router } from '@angular/router';
import { EMPTY, Observable, of } from 'rxjs';
import { mergeMap } from 'rxjs/operators';

import { IAgentType } from '../agent-type.model';
import { AgentTypeService } from '../service/agent-type.service';

const agentTypeResolve = (route: ActivatedRouteSnapshot): Observable<null | IAgentType> => {
  const id = route.params.id;
  if (id) {
    return inject(AgentTypeService)
      .find(id)
      .pipe(
        mergeMap((agentType: HttpResponse<IAgentType>) => {
          if (agentType.body) {
            return of(agentType.body);
          }
          inject(Router).navigate(['404']);
          return EMPTY;
        }),
      );
  }
  return of(null);
};

export default agentTypeResolve;
