import React from 'react'
import { useForm } from 'react-hook-form'
import Button from 'react-bootstrap/Button';
import Modal from 'react-bootstrap/Modal';
import { toast } from 'react-hot-toast';
import { apiUrl, token } from '../../common/Config';

const CreateLesson = ({ showLessonModal, handleCloseModal,setChapters, course }) => {

    //for button disabling
    const [loading, setLoading] = React.useState(false)
    
    const { register, handleSubmit, formState: { errors }, setError, reset } = useForm()
    //console.log(course)


    //store lesson
    const onSubmit = async (data) => {

        setLoading(true)
        await fetch(`${apiUrl}/lessons`, {
            method:"POST",
            headers:{
                'Content-Type':'application/json',
                'Accept':'application/json',
                'Authorization':`Bearer ${token}`
            },
            body:JSON.stringify(data)
        }).then(res=>res.json())
        .then(result=>{
            if(result.status==200){
                setLoading(false)
                toast.success(result.message)
                handleCloseModal(true)
                setChapters({type:"UPDATE_CHAPTER",payload:result.chapter})
                reset({
                    chapter:'',
                    lesson:'',
                    status:1
                })
            }
        })
    }
    return (
        <>
            <Modal size='lg' show={showLessonModal} onHide={handleCloseModal}>
                <form onSubmit={handleSubmit(onSubmit)}>
                    <Modal.Header closeButton>
                        <Modal.Title>Create Lesson</Modal.Title>
                    </Modal.Header>
                    <Modal.Body>
                        <div className='mb-3'>
                            <label htmlFor="chapter" className='form-label'>Chapter</label>
                            <select
                                {
                                ...register('chapter', {
                                    required: 'please select a chapter'
                                })
                                }
                                className={`form-select ${errors.chapter && 'is-invalid'}`}>
                                <option value="">Select a Chapter</option>
                                {
                                    course.chapters && course.chapters.map(chapter => {
                                        return <option key={chapter.id} value={chapter.id}>{chapter.title}</option>
                                    })
                                }
                            </select>
                            {
                                errors.chapter && <p className='invalid-feedback'>{errors.chapter.message}</p>
                            }
                        </div>
                        <div className='mb-3'>
                            <label htmlFor="lesson" className='form-label'>Lesson</label>
                            <input
                                {
                                ...register('lesson', {
                                    required: 'the lesson field is required'
                                })
                                }
                                type="text"
                                placeholder='Lesson'
                                className={`form-control ${errors.lesson && 'is-invalid'}`}
                            />
                            {
                                errors.lesson && <p className='invalid-feedback'>{errors.lesson.message}</p>
                            }
                        </div>

                        <div className="mb-3">
                            <label htmlFor="status" className='form-label'>Status</label>
                            <select
                                {
                                ...register('status',{
                                    required: 'please select a status'
                                })
                                }
                                className={`form-select ${errors.status && 'is-invalid'}`}
                            >
                                <option value="1">Active</option>
                                <option value="0">Block</option>
                            </select>
                            {
                                errors.status && <p className='invalid-feedback'>{errors.status.message}</p>
                            }
                        </div>
                    </Modal.Body>
                    <Modal.Footer>
                        <Button disabled={loading} type='submit' className='btn btn-primary' variant="primary">
                            {loading ? 'Saving...' : 'Save'}
                        </Button>
                    </Modal.Footer>
                </form>
            </Modal>

        </>
    )
}

export default CreateLesson