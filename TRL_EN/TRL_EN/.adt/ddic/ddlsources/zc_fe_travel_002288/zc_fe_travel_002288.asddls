@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: 'Projection View for Travel'
@ObjectModel.semanticKey: [ 'TravelID' ]
@Search.searchable: true
define root view entity ZC_FE_Travel_002288
  as projection on ZI_FE_Travel_002288
{
  key TravelUUID,
  @Search.defaultSearchElement: true
  @Search.fuzzinessThreshold: 0.90 
  @EndUserText.label: 'Travel'
  
  @ObjectModel.text.element: ['Description']
  TravelID,
  @Consumption.valueHelpDefinition: [ {
    entity: {
      name: '/DMO/I_Agency', 
      element: 'AgencyID'
    }
  } ]
  
  @EndUserText.label: 'Agency'
  @ObjectModel.text.element: ['AgencyName']
  AgencyID,
  _Agency.Name as AgencyName,
  
  @Consumption.valueHelpDefinition: [ {
    entity: {
      name: '/DMO/I_Customer', 
      element: 'CustomerID'
    }
  } ]
  
  @EndUserText.label: 'Customer'
  @ObjectModel.text.element: ['LastName']
  CustomerID,
  _Customer.LastName as LastName,
  
  @EndUserText.label: 'Start Date'
  BeginDate,
  
  @EndUserText.label: 'End date'
  EndDate,
  @EndUserText.label: 'Booking Fee'
  @Semantics.amount.currencyCode: 'CurrencyCode'
  BookingFee,
  @EndUserText.label: 'Total price'
  @Semantics.amount.currencyCode: 'CurrencyCode'
  TotalPrice,
  @Consumption.valueHelpDefinition: [ {
    entity: {
      name: 'I_Currency', 
      element: 'Currency'
    }
  } ]
  CurrencyCode,
  Description,
  
  @Consumption.valueHelpDefinition: [ {
    entity: {
      name: 'zi_fe_stat_002288', 
      element: 'TravelStatusId'
    }
  } ]
  
  @EndUserText.label: 'Status'
  @ObjectModel.text.element: ['StatusText']
  OverallStatus,
  _TravelStatus.TravelStatusText as StatusText,
  
  CreatedBy,
  CreatedAt,
  LastChangedBy,
  LastChangedAt,
  LocalLastChangedAt,
  _Booking : redirected to composition child ZC_FE_Booking_002288,
  _Agency,
  _Currency,
  _Customer,
  _TravelStatus
  
}
