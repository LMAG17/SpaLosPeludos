import React, { useState } from "react";
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
    InputGroup,
    Modal,
    ModalHeader,
    ModalBody,
    ModalFooter
} from "reactstrap";
import { Formik } from "formik";
import { db } from "./firebase/firebase-config";

const FormContact = (props) => {
    const {
        className
    } = props;

    const [modal, setModal] = useState(false);

    const toggle = () => setModal(!modal);

    return (
        <Container fluid="true" className="py-5 w-75">
            <h3 className="text-center display-4 mb-5" >Agenda tu cita</h3>
            <Row className="w-100" >
                <Col sm="12" md="12" lg="6">
                    <Formik
                        initialValues={{
                            name: "",
                            phone: "",
                            email: "",
                            pet: "",
                            breed: "",
                            address: ""
                        }}
                        validate={values => {
                            const errors = {}
                            if (!values.email) {
                                errors.email = "Campo obligatorio";

                            }
                            else if (
                                !/^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}$/i.test(values.email)
                            ) {
                                errors.email = 'Invalid email address';
                            }
                            return errors;
                        }}
                        onSubmit={async (values, { setSubmitting }) => {
                            await db.collection("ClientForm").doc().set(values).then(() => {
                                values.name = "";
                                values.phone = "";
                                values.email = "";
                                values.pet = "";
                                values.breed = "";
                                values.address = "";
                                toggle()
                            }).catch(() => {

                            })

                        }}
                    >
                        {({
                            values,
                            errors,
                            touched,
                            handleChange,
                            handleBlur,
                            handleSubmit,
                            isSubmitting,
                            /* and other goodies */
                        }) => (<Form onSubmit={handleSubmit}>
                            <Row form >
                                <Col md={6}>
                                    <FormGroup>
                                        <Label for="name">Nombre</Label>
                                        <Input
                                            onChange={handleChange}
                                            onBlur={handleBlur}
                                            value={values.name}
                                            type="name" required name="name" id="name" placeholder="Tu nombre" />
                                    </FormGroup>
                                </Col>
                                <Col md={6}>
                                    <FormGroup>
                                        <Label for="phone">Telefono</Label>
                                        <InputGroup>
                                            <InputGroupAddon addonType="prepend">
                                                <InputGroupText>+57</InputGroupText>
                                            </InputGroupAddon>
                                            <Input
                                                onChange={handleChange}
                                                onBlur={handleBlur}
                                                value={values.phone} type="number"required name="phone" id="phone" placeholder="1234567890" />
                                        </InputGroup>
                                    </FormGroup>
                                </Col>
                            </Row>
                            <FormGroup>
                                <Label for="email">Correo electronico</Label>

                                <FormFeedback tooltip>You will not be able to see this</FormFeedback>
                                <Input
                                    onChange={handleChange}
                                    onBlur={handleBlur}
                                    value={values.email} type="email" name="email" id="email" placeholder="Tu correo electronico" required  >
                                </Input>
                            </FormGroup>
                            <Row form>
                                <Col md={6}>
                                    <FormGroup>
                                        <Label for="pet">Peludito</Label>
                                        <Input
                                            onChange={handleChange}
                                            onBlur={handleBlur}
                                            value={values.pet} required type="text" name="pet" id="pet" placeholder="El nombre de tu peludito" />
                                    </FormGroup>
                                </Col>
                                <Col md={6}>
                                    <FormGroup>
                                        <Label for="breed">Raza</Label>
                                        <Input
                                            onChange={handleChange}
                                            onBlur={handleBlur}
                                            value={values.breed}
                                            required type="text" name="breed" id="breed" placeholder="La raza de tu peludito" />
                                    </FormGroup>
                                </Col>
                            </Row>
                            <FormGroup>
                                <Label for="address">Dirección</Label>
                                <Input
                                    onChange={handleChange}
                                    onBlur={handleBlur}
                                    value={values.address} required type="text" name="address" id="address" placeholder="La direccion de tu casa" />
                            </FormGroup>

                            <FormGroup check className="mb-3">
                                <Input required type="checkbox" name="terms" id="termsCheck" />
                                <Label for="check" check>Acepto terminos y condiciones</Label>
                            </FormGroup>
                            <Button color="primary" className="w-100" type="submit" disabled={isSubmitting}>Agendar</Button>
                        </Form>

                            )}
                    </Formik>

                </Col>
                <Col md="6" className="d-none d-lg-inline p-0">
                    <img src="https://thumbs.dreamstime.com/b/perro-del-negocio-en-el-tel%C3%A9fono-31335268.jpg" alt="Guau Guau"></img>
                </Col>
            </Row>
            <Modal isOpen={modal} modalTransition={{ timeout: 700 }} backdropTransition={{ timeout: 1300 }}
                toggle={toggle} className={className}>
                <ModalHeader toggle={toggle}>Tu reservacion esta en proceso</ModalHeader>
                <ModalBody>
                    Nos pondremos en contacto contigo pronto, esperamos tengas un excelente dia
          </ModalBody>
                <ModalFooter>
                    <Button color="primary" onClick={toggle}>Ok</Button>{' '}
                </ModalFooter>
            </Modal>

        </Container>
    );
}

export default FormContact;