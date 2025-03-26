import { TestBed } from '@angular/core/testing';

import { sampleWithNewData, sampleWithRequiredData } from '../agent-type.test-samples';

import { AgentTypeFormService } from './agent-type-form.service';

describe('AgentType Form Service', () => {
  let service: AgentTypeFormService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(AgentTypeFormService);
  });

  describe('Service methods', () => {
    describe('createAgentTypeFormGroup', () => {
      it('should create a new form with FormControl', () => {
        const formGroup = service.createAgentTypeFormGroup();

        expect(formGroup.controls).toEqual(
          expect.objectContaining({
            id: expect.any(Object),
            name: expect.any(Object),
            description: expect.any(Object),
          }),
        );
      });

      it('passing IAgentType should create a new form with FormGroup', () => {
        const formGroup = service.createAgentTypeFormGroup(sampleWithRequiredData);

        expect(formGroup.controls).toEqual(
          expect.objectContaining({
            id: expect.any(Object),
            name: expect.any(Object),
            description: expect.any(Object),
          }),
        );
      });
    });

    describe('getAgentType', () => {
      it('should return NewAgentType for default AgentType initial value', () => {
        const formGroup = service.createAgentTypeFormGroup(sampleWithNewData);

        const agentType = service.getAgentType(formGroup) as any;

        expect(agentType).toMatchObject(sampleWithNewData);
      });

      it('should return NewAgentType for empty AgentType initial value', () => {
        const formGroup = service.createAgentTypeFormGroup();

        const agentType = service.getAgentType(formGroup) as any;

        expect(agentType).toMatchObject({});
      });

      it('should return IAgentType', () => {
        const formGroup = service.createAgentTypeFormGroup(sampleWithRequiredData);

        const agentType = service.getAgentType(formGroup) as any;

        expect(agentType).toMatchObject(sampleWithRequiredData);
      });
    });

    describe('resetForm', () => {
      it('passing IAgentType should not enable id FormControl', () => {
        const formGroup = service.createAgentTypeFormGroup();
        expect(formGroup.controls.id.disabled).toBe(true);

        service.resetForm(formGroup, sampleWithRequiredData);

        expect(formGroup.controls.id.disabled).toBe(true);
      });

      it('passing NewAgentType should disable id FormControl', () => {
        const formGroup = service.createAgentTypeFormGroup(sampleWithRequiredData);
        expect(formGroup.controls.id.disabled).toBe(true);

        service.resetForm(formGroup, { id: null });

        expect(formGroup.controls.id.disabled).toBe(true);
      });
    });
  });
});
