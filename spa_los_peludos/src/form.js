import React, { Component } from "react";
import perro from "./assets/img/dog.png";
import {
    Col,
    Row,
    Form,
    FormGroup,
    Container,
    Label,
    Input,
    Button
} from "reactstrap";

class FormContact extends Component {
    render() {
        return (
            <Container fluid="true" className="py-5 w-75">
                <h3 className="text-center display-4 mb-5" >Agenda tu cita</h3>
                <Row className="w-100" >
                    <Col sm="12" md="12" lg="6">
                        <Form>
                            <Row form>
                                <Col md={6}>
                                    <FormGroup>
                                        <Label for="name">Nombre</Label>
                                        <Input type="name" name="name" id="name" placeholder="Tu nombre" />
                                    </FormGroup>
                                </Col>
                                <Col md={6}>
                                    <FormGroup>
                                        <Label for="phone">Telefono</Label>
                                        <Input type="phone" name="phone" id="phone" placeholder="1234567890" />
                                    </FormGroup>
                                </Col>
                            </Row>
                            <FormGroup>
                                <Label for="email">Correo electronico</Label>
                                <Input type="email" name="email" id="email" placeholder="Tu correo electronico" />
                            </FormGroup>
                            <Row form>
                                <Col md={6}>
                                    <FormGroup>
                                        <Label for="pet">Peludito</Label>
                                        <Input type="text" name="pet" id="pet" placeholder="El nombre de tu peludito" />
                                    </FormGroup>
                                </Col>
                                <Col md={6}>
                                    <FormGroup>
                                        <Label for="breed">Raza</Label>
                                        <Input type="text" name="breed" id="breed" placeholder="La raza de tu peludito" />
                                    </FormGroup>
                                </Col>
                            </Row>
                            <FormGroup>
                                <Label for="address">Dirección</Label>
                                <Input type="text" name="address" id="address" placeholder="La direccion de tu casa" />
                            </FormGroup>
                            <Button color="primary" className="w-100">Agendar</Button>
                        </Form>
                    </Col>

                    <Col md="6" className="d-none d-lg-inline p-0">
                        <img src="https://thumbs.dreamstime.com/b/perro-del-negocio-en-el-tel%C3%A9fono-31335268.jpg" alt="Guau Guau"></img>
                    </Col>
                </Row>
            </Container>
        );
    }
}
export default FormContact;