module com.cinema.project {
    requires javafx.controls;
    requires javafx.fxml;

    opens com.cinema.project to javafx.fxml;
    exports com.cinema.project;
}
