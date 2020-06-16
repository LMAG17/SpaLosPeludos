import React, { Component } from "react";
import {
    Col,
    Row,
    Form,
    FormGroup,
    Container,
    Label,
    Input,
    Button,
    FormFeedback,
    InputGroupAddon,
    InputGroupText,
    InputGroup
} from "reactstrap";

class FormContact extends Component {

    constructor(props) {
        super(props);
        this.state = {
            name : '',
            hone: '',
            email: '',
            pet: '',
            breed: '',
            address: '',
            check: ''
        };
    }

    componentDidMount(){
        const submit = () => {
            console.log(this.state.name, this.state.phone, this.state.email, this.state.pet, this.state.breed, this.state.address, this.state.check);
        }
    }

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
                                        <Input type="name" name="name" id="name" placeholder="Tu nombre" onChange={(v) => this.setState({name:v.target.value})} />
                                    </FormGroup>
                                </Col>
                                <Col md={6}>
                                    <FormGroup>
                                        <Label for="phone">Telefono</Label>
                                        <InputGroup>
                                            <InputGroupAddon addonType="prepend">
                                                <InputGroupText>+57</InputGroupText>
                                            </InputGroupAddon>
                                            <Input type="number" name="phone" id="phone" placeholder="1234567890" onChange={(v) => this.setState({phone:v.target.value})} />
                                        </InputGroup>
                                    </FormGroup>
                                </Col>
                            </Row>
                            <FormGroup>
                                <Label for="email">Correo electronico</Label>

                                <FormFeedback tooltip>You will not be able to see this</FormFeedback>
                                <Input type="email" name="email" id="email" placeholder="Tu correo electronico" valid onChange={(v) => this.setState({email:v.target.value})} />
                            </FormGroup>
                            <Row form>
                                <Col md={6}>
                                    <FormGroup>
                                        <Label for="pet">Peludito</Label>
                                        <Input type="text" name="pet" id="pet" placeholder="El nombre de tu peludito" onChange={(v) => this.setState({pet:v.target.value})} />
                                    </FormGroup>
                                </Col>
                                <Col md={6}>
                                    <FormGroup>
                                        <Label for="breed">Raza</Label>
                                        <Input type="text" name="breed" id="breed" placeholder="La raza de tu peludito" onChange={(v) => this.setState({breed:v.target.value})} />
                                    </FormGroup>
                                </Col>
                            </Row>
                            <FormGroup>
                                <Label for="address">Dirección</Label>
                                <Input type="text" name="address" id="address" placeholder="La direccion de tu casa" onChange={(v) => this.setState({address:v.target.value})} />
                            </FormGroup>

                            <FormGroup check className="mb-3">
                                <Input type="checkbox" name="check" id="termsCheck" onChange={(v) => this.setState({check:v.target.value})} />
                                <Label for="check" check>Acepto terminos y condiciones</Label>
                            </FormGroup>
                            <Button color="primary" className="w-100" onClick={this.submit}>Agendar</Button>
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