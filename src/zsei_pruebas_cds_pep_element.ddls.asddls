@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Pep Element'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZSEI_PRUEBAS_CDS_PEP_ELEMENT
  as select from    I_WBSElement       as _WBSElement
    left outer join I_ProjectBasicData as _ProjectBasicData on _WBSElement.ProjectInternalID = _ProjectBasicData.ProjectInternalID

{
  key cast (_WBSElement.WBSElement as abap.char(24) )         as WBSElementExternalID, //prps-posid
      cast( _WBSElement.WBSElementInternalID as abap.char(8)) as WBSElementInternalID, //prps-pspnr
      cast( _WBSElement.Project as abap.char(24) )            as EnterpriseProject, //proj-pspid
      _WBSElement.WBSDescription, //prps-post1
      _WBSElement.CompanyCode,  //prps-pbukr
      _WBSElement.ProfitCenter, //prps-prctr
      _WBSElement.RequestingCostCenter                        as CostCenter, //prps-akstl
      _WBSElement.ResponsiblePersonName                       as WBSResponsible, //prps-verna
      _ProjectBasicData.PlannedStartDate, //proj-plfaz
      _ProjectBasicData.PlannedEndDate //proj-plsez
}
