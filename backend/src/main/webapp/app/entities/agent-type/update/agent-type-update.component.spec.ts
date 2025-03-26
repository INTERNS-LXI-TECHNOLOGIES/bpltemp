import { ComponentFixture, TestBed } from '@angular/core/testing';
import { HttpResponse, provideHttpClient } from '@angular/common/http';
import { FormBuilder } from '@angular/forms';
import { ActivatedRoute } from '@angular/router';
import { Subject, from, of } from 'rxjs';

import { AgentTypeService } from '../service/agent-type.service';
import { IAgentType } from '../agent-type.model';
import { AgentTypeFormService } from './agent-type-form.service';

import { AgentTypeUpdateComponent } from './agent-type-update.component';

describe('AgentType Management Update Component', () => {
  let comp: AgentTypeUpdateComponent;
  let fixture: ComponentFixture<AgentTypeUpdateComponent>;
  let activatedRoute: ActivatedRoute;
  let agentTypeFormService: AgentTypeFormService;
  let agentTypeService: AgentTypeService;

  beforeEach(() => {
    TestBed.configureTestingModule({
      imports: [AgentTypeUpdateComponent],
      providers: [
        provideHttpClient(),
        FormBuilder,
        {
          provide: ActivatedRoute,
          useValue: {
            params: from([{}]),
          },
        },
      ],
    })
      .overrideTemplate(AgentTypeUpdateComponent, '')
      .compileComponents();

    fixture = TestBed.createComponent(AgentTypeUpdateComponent);
    activatedRoute = TestBed.inject(ActivatedRoute);
    agentTypeFormService = TestBed.inject(AgentTypeFormService);
    agentTypeService = TestBed.inject(AgentTypeService);

    comp = fixture.componentInstance;
  });

  describe('ngOnInit', () => {
    it('Should update editForm', () => {
      const agentType: IAgentType = { id: 16861 };

      activatedRoute.data = of({ agentType });
      comp.ngOnInit();

      expect(comp.agentType).toEqual(agentType);
    });
  });

  describe('save', () => {
    it('Should call update service on save for existing entity', () => {
      // GIVEN
      const saveSubject = new Subject<HttpResponse<IAgentType>>();
      const agentType = { id: 24386 };
      jest.spyOn(agentTypeFormService, 'getAgentType').mockReturnValue(agentType);
      jest.spyOn(agentTypeService, 'update').mockReturnValue(saveSubject);
      jest.spyOn(comp, 'previousState');
      activatedRoute.data = of({ agentType });
      comp.ngOnInit();

      // WHEN
      comp.save();
      expect(comp.isSaving).toEqual(true);
      saveSubject.next(new HttpResponse({ body: agentType }));
      saveSubject.complete();

      // THEN
      expect(agentTypeFormService.getAgentType).toHaveBeenCalled();
      expect(comp.previousState).toHaveBeenCalled();
      expect(agentTypeService.update).toHaveBeenCalledWith(expect.objectContaining(agentType));
      expect(comp.isSaving).toEqual(false);
    });

    it('Should call create service on save for new entity', () => {
      // GIVEN
      const saveSubject = new Subject<HttpResponse<IAgentType>>();
      const agentType = { id: 24386 };
      jest.spyOn(agentTypeFormService, 'getAgentType').mockReturnValue({ id: null });
      jest.spyOn(agentTypeService, 'create').mockReturnValue(saveSubject);
      jest.spyOn(comp, 'previousState');
      activatedRoute.data = of({ agentType: null });
      comp.ngOnInit();

      // WHEN
      comp.save();
      expect(comp.isSaving).toEqual(true);
      saveSubject.next(new HttpResponse({ body: agentType }));
      saveSubject.complete();

      // THEN
      expect(agentTypeFormService.getAgentType).toHaveBeenCalled();
      expect(agentTypeService.create).toHaveBeenCalled();
      expect(comp.isSaving).toEqual(false);
      expect(comp.previousState).toHaveBeenCalled();
    });

    it('Should set isSaving to false on error', () => {
      // GIVEN
      const saveSubject = new Subject<HttpResponse<IAgentType>>();
      const agentType = { id: 24386 };
      jest.spyOn(agentTypeService, 'update').mockReturnValue(saveSubject);
      jest.spyOn(comp, 'previousState');
      activatedRoute.data = of({ agentType });
      comp.ngOnInit();

      // WHEN
      comp.save();
      expect(comp.isSaving).toEqual(true);
      saveSubject.error('This is an error!');

      // THEN
      expect(agentTypeService.update).toHaveBeenCalled();
      expect(comp.isSaving).toEqual(false);
      expect(comp.previousState).not.toHaveBeenCalled();
    });
  });
});
