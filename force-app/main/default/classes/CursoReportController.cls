public class CursoReportController {
    public Curso__c curso { get; set; }
    public List<Inscripcion_a_Curso__c> inscripciones { get; set; }
    public CursoReportController(ApexPages.StandardController controller) {
        Id cursoId = ApexPages.currentPage().getParameters().get('id');
        this.curso =[SELECT Name, Curso_Area__c, Cantidad_de_Clases__c, Descripcion__c, Organizaci_n_que_lo_dicta__r.Name,
                            Cupo_de_Participantes__c, D_a_de_cursada__c, Fecha_de_Inicio__c, Fecha_de_Fin__c, Estado__c
                     FROM Curso__c
                     WHERE Id = :cursoId]; 
        this.inscripciones = [SELECT Espartano__r.Name, Espartano__r.Pabell_n__r.Name, Estado_final__c, Porcentaje_de_asistencia__c
                              FROM Inscripcion_a_Curso__c
                              WHERE Curso__c = :cursoId
                              ORDER BY Espartano__r.LastName ASC];
    }
}