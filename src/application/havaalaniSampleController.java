package application;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Connection;
import java.sql.SQLException;
import java.io.IOException;
import java.net.URL;
import java.time.LocalDate;
import java.util.ResourceBundle;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Alert;
import javafx.scene.control.Button;
import javafx.scene.control.CheckBox;
import javafx.scene.control.ChoiceBox;
import javafx.scene.control.DatePicker;
import javafx.scene.control.Alert.AlertType;
import javafx.stage.Stage;

public class havaalaniSampleController {

   @FXML
   private ResourceBundle resources;

   @FXML
   private URL location;

   @FXML
   private Button biletal;

   @FXML
   private CheckBox tekyon;

   @FXML
   private CheckBox aktarmasiz;

   @FXML
   private ChoiceBox < String > nereden;

   @FXML
   private ChoiceBox < String > nereye;

   @FXML
   private DatePicker gidis_trh;

   @FXML
   private DatePicker donus_trh;

   @FXML
   private ChoiceBox < Integer > yetiskin;

   @FXML
   private ChoiceBox < Integer > ogrenci;

   @FXML
   private ChoiceBox < Integer > bebek;

   @FXML
   private ChoiceBox < Integer > cocuk;

   @FXML
   void aktarmasiz_click(ActionEvent event) {

      tekyon.setSelected(false);
   }

   @FXML
   void tekyon_click(ActionEvent event) {
      aktarmasiz.setSelected(false);

   }

   @FXML
   void biletalClick(ActionEvent event) {

      if (nereden.getSelectionModel().isEmpty() || nereye.getSelectionModel().isEmpty() || gidis_trh.getValue() == null || donus_trh == null || yetiskin.getSelectionModel().isEmpty() || ogrenci.getSelectionModel().isEmpty() || bebek.getSelectionModel().isEmpty() || cocuk.getSelectionModel().isEmpty()) {
         Alert alert = new Alert(AlertType.ERROR);
         alert.setTitle("Hata ");
         alert.setHeaderText("Lutfen eksik alanlari doldurunuz!!!");

         alert.showAndWait();
      } else {
         String Snereden = nereden.getValue();
         String Snereye = nereye.getValue();
         LocalDate lgidistarihi = gidis_trh.getValue();
         LocalDate ldonustarihi = donus_trh.getValue();
         boolean Btekyon = tekyon.isSelected();
         boolean Baktarmasiz = aktarmasiz.isSelected();
         int Syetiskin = yetiskin.getValue();
         int Sogrenci = ogrenci.getValue();
         int Scocuk = cocuk.getValue();
         int Sbebek = bebek.getValue();

         FXMLLoader loader = new FXMLLoader(getClass().getResource("rotalistSample.fxml"));

         try {
            Parent root = loader.load();
            rotalistSampleController rotalistSampleController = loader.getController();
            rotalistSampleController.Verigetir(Snereden, Snereye, lgidistarihi, ldonustarihi, Btekyon, Baktarmasiz, Syetiskin, Sogrenci, Scocuk, Sbebek);

            Stage stage = new Stage();
            Scene scene = new Scene(root);
            stage.setScene(scene);
            stage.show();

         } catch (IOException e) {
            e.printStackTrace();
         }
      }

   }
   @FXML
   void initialize() {

      Connection conn = null;
      try {
         ObservableList < String > listacombo = FXCollections.observableArrayList();
         String consulta = "select *  from havaalanitablosu";
         conn = DriverManager.getConnection("jdbc:mysql://localhost/ucakotomasyonu", "root", "");
         PreparedStatement ps = conn.prepareStatement(consulta);
         ResultSet rs = ps.executeQuery();

         while (rs.next()) {
            listacombo.add(rs.getString("Sehir"));

         }

         nereden.setItems(listacombo);
         nereye.setItems(listacombo);

      } catch (SQLException e) {
         e.printStackTrace();
      }
      yetiskin.getItems().add(0);
      yetiskin.getItems().add(1);
      yetiskin.getItems().add(2);
      yetiskin.getItems().add(3);
      yetiskin.getItems().add(4);
      yetiskin.getItems().add(5);
      yetiskin.getItems().add(6);
      yetiskin.getItems().add(7);
      yetiskin.getItems().add(8);
      yetiskin.getItems().add(9);
      yetiskin.getItems().add(10);

      ogrenci.getItems().add(0);
      ogrenci.getItems().add(1);
      ogrenci.getItems().add(2);
      ogrenci.getItems().add(3);
      ogrenci.getItems().add(4);
      ogrenci.getItems().add(5);
      ogrenci.getItems().add(6);
      ogrenci.getItems().add(7);
      ogrenci.getItems().add(8);
      ogrenci.getItems().add(9);
      ogrenci.getItems().add(10);

      bebek.getItems().add(0);
      bebek.getItems().add(1);
      bebek.getItems().add(2);
      bebek.getItems().add(3);
      bebek.getItems().add(4);
      bebek.getItems().add(5);
      bebek.getItems().add(6);
      bebek.getItems().add(7);
      bebek.getItems().add(8);
      bebek.getItems().add(9);
      bebek.getItems().add(10);

      cocuk.getItems().add(0);
      cocuk.getItems().add(1);
      cocuk.getItems().add(2);
      cocuk.getItems().add(3);
      cocuk.getItems().add(4);
      cocuk.getItems().add(5);
      cocuk.getItems().add(6);
      cocuk.getItems().add(7);
      cocuk.getItems().add(8);
      cocuk.getItems().add(9);
      cocuk.getItems().add(10);

      yetiskin.setValue(1);
      ogrenci.setValue(0);
      bebek.setValue(0);
      cocuk.setValue(0);

   }}

