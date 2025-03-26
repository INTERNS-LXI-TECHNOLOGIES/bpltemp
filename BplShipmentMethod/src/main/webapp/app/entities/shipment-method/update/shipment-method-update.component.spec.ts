import { ComponentFixture, TestBed } from '@angular/core/testing';
import { HttpResponse, provideHttpClient } from '@angular/common/http';
import { FormBuilder } from '@angular/forms';
import { ActivatedRoute } from '@angular/router';
import { Subject, from, of } from 'rxjs';

import { IFacilityType } from 'app/entities/facility-type/facility-type.model';
import { FacilityTypeService } from 'app/entities/facility-type/service/facility-type.service';
import { ShipmentMethodService } from '../service/shipment-method.service';
import { IShipmentMethod } from '../shipment-method.model';
import { ShipmentMethodFormService } from './shipment-method-form.service';

import { ShipmentMethodUpdateComponent } from './shipment-method-update.component';

describe('ShipmentMethod Management Update Component', () => {
  let comp: ShipmentMethodUpdateComponent;
  let fixture: ComponentFixture<ShipmentMethodUpdateComponent>;
  let activatedRoute: ActivatedRoute;
  let shipmentMethodFormService: ShipmentMethodFormService;
  let shipmentMethodService: ShipmentMethodService;
  let facilityTypeService: FacilityTypeService;

  beforeEach(() => {
    TestBed.configureTestingModule({
      imports: [ShipmentMethodUpdateComponent],
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
      .overrideTemplate(ShipmentMethodUpdateComponent, '')
      .compileComponents();

    fixture = TestBed.createComponent(ShipmentMethodUpdateComponent);
    activatedRoute = TestBed.inject(ActivatedRoute);
    shipmentMethodFormService = TestBed.inject(ShipmentMethodFormService);
    shipmentMethodService = TestBed.inject(ShipmentMethodService);
    facilityTypeService = TestBed.inject(FacilityTypeService);

    comp = fixture.componentInstance;
  });

  describe('ngOnInit', () => {
    it('Should call FacilityType query and add missing value', () => {
      const shipmentMethod: IShipmentMethod = { id: 22712 };
      const parentType: IFacilityType = { id: 18255 };
      shipmentMethod.parentType = parentType;

      const facilityTypeCollection: IFacilityType[] = [{ id: 18255 }];
      jest.spyOn(facilityTypeService, 'query').mockReturnValue(of(new HttpResponse({ body: facilityTypeCollection })));
      const additionalFacilityTypes = [parentType];
      const expectedCollection: IFacilityType[] = [...additionalFacilityTypes, ...facilityTypeCollection];
      jest.spyOn(facilityTypeService, 'addFacilityTypeToCollectionIfMissing').mockReturnValue(expectedCollection);

      activatedRoute.data = of({ shipmentMethod });
      comp.ngOnInit();

      expect(facilityTypeService.query).toHaveBeenCalled();
      expect(facilityTypeService.addFacilityTypeToCollectionIfMissing).toHaveBeenCalledWith(
        facilityTypeCollection,
        ...additionalFacilityTypes.map(expect.objectContaining),
      );
      expect(comp.facilityTypesSharedCollection).toEqual(expectedCollection);
    });

    it('Should update editForm', () => {
      const shipmentMethod: IShipmentMethod = { id: 22712 };
      const parentType: IFacilityType = { id: 18255 };
      shipmentMethod.parentType = parentType;

      activatedRoute.data = of({ shipmentMethod });
      comp.ngOnInit();

      expect(comp.facilityTypesSharedCollection).toContainEqual(parentType);
      expect(comp.shipmentMethod).toEqual(shipmentMethod);
    });
  });

  describe('save', () => {
    it('Should call update service on save for existing entity', () => {
      // GIVEN
      const saveSubject = new Subject<HttpResponse<IShipmentMethod>>();
      const shipmentMethod = { id: 28010 };
      jest.spyOn(shipmentMethodFormService, 'getShipmentMethod').mockReturnValue(shipmentMethod);
      jest.spyOn(shipmentMethodService, 'update').mockReturnValue(saveSubject);
      jest.spyOn(comp, 'previousState');
      activatedRoute.data = of({ shipmentMethod });
      comp.ngOnInit();

      // WHEN
      comp.save();
      expect(comp.isSaving).toEqual(true);
      saveSubject.next(new HttpResponse({ body: shipmentMethod }));
      saveSubject.complete();

      // THEN
      expect(shipmentMethodFormService.getShipmentMethod).toHaveBeenCalled();
      expect(comp.previousState).toHaveBeenCalled();
      expect(shipmentMethodService.update).toHaveBeenCalledWith(expect.objectContaining(shipmentMethod));
      expect(comp.isSaving).toEqual(false);
    });

    it('Should call create service on save for new entity', () => {
      // GIVEN
      const saveSubject = new Subject<HttpResponse<IShipmentMethod>>();
      const shipmentMethod = { id: 28010 };
      jest.spyOn(shipmentMethodFormService, 'getShipmentMethod').mockReturnValue({ id: null });
      jest.spyOn(shipmentMethodService, 'create').mockReturnValue(saveSubject);
      jest.spyOn(comp, 'previousState');
      activatedRoute.data = of({ shipmentMethod: null });
      comp.ngOnInit();

      // WHEN
      comp.save();
      expect(comp.isSaving).toEqual(true);
      saveSubject.next(new HttpResponse({ body: shipmentMethod }));
      saveSubject.complete();

      // THEN
      expect(shipmentMethodFormService.getShipmentMethod).toHaveBeenCalled();
      expect(shipmentMethodService.create).toHaveBeenCalled();
      expect(comp.isSaving).toEqual(false);
      expect(comp.previousState).toHaveBeenCalled();
    });

    it('Should set isSaving to false on error', () => {
      // GIVEN
      const saveSubject = new Subject<HttpResponse<IShipmentMethod>>();
      const shipmentMethod = { id: 28010 };
      jest.spyOn(shipmentMethodService, 'update').mockReturnValue(saveSubject);
      jest.spyOn(comp, 'previousState');
      activatedRoute.data = of({ shipmentMethod });
      comp.ngOnInit();

      // WHEN
      comp.save();
      expect(comp.isSaving).toEqual(true);
      saveSubject.error('This is an error!');

      // THEN
      expect(shipmentMethodService.update).toHaveBeenCalled();
      expect(comp.isSaving).toEqual(false);
      expect(comp.previousState).not.toHaveBeenCalled();
    });
  });

  describe('Compare relationships', () => {
    describe('compareFacilityType', () => {
      it('Should forward to facilityTypeService', () => {
        const entity = { id: 18255 };
        const entity2 = { id: 4814 };
        jest.spyOn(facilityTypeService, 'compareFacilityType');
        comp.compareFacilityType(entity, entity2);
        expect(facilityTypeService.compareFacilityType).toHaveBeenCalledWith(entity, entity2);
      });
    });
  });
});
