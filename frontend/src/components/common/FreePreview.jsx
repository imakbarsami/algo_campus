import React from 'react'
import Button from 'react-bootstrap/Button';
import Modal from 'react-bootstrap/Modal';
import ReactPlayer from 'react-player';

const FreePreview = ({show,handleClose,lessonData}) => {
  return (
        <Modal size='lg' show={show} onHide={handleClose}>
            <Modal.Header closeButton>
            <Modal.Title>{lessonData.title}</Modal.Title>
            </Modal.Header>
            <Modal.Body>
                <ReactPlayer
                   width={"100%"}
                   height={"100%"}
                   controls
                   config={
                    {
                        file:{
                            attribute:{
                                controlsList:"nodownload"
                            }
                        }
                    }
                   }
                    url={lessonData.video_url}
                />
            </Modal.Body>
            <Modal.Footer>
            <Button variant="secondary" onClick={handleClose}>
                Close
            </Button>
           
            </Modal.Footer>
        </Modal>
  )
}

export default FreePreview